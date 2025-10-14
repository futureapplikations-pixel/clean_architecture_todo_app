import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/memento.dart';
import '../utils/constants.dart';
import '../viewmodel/mementoform/memento_form.dart';
import '../widgets/actions.dart';
import '../widgets/article.dart';
import '../widgets/forms.dart';

class MementoFormPage extends ConsumerStatefulWidget {
  const MementoFormPage({
    Key? key,
    this.memento,
    this.showSave = true,
  }) : super(key: key);

  final Memento? memento;
  final bool showSave;

  @override
  ConsumerState<MementoFormPage> createState() => _MementoFormPageState();
}

class _MementoFormPageState extends ConsumerState<MementoFormPage> {
  late MementoFormViewModel viewModel;
  final _formKey = GlobalKey<FormState>();
  Timer? _debounce;

  @override
  void initState() {
    viewModel = ref.read(mementoFormViewModelProvider(widget.memento).notifier);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MementoFormPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.memento != widget.memento) {
      _formKey.currentState?.reset();
      viewModel = ref.watch(mementoFormViewModelProvider(widget.memento).notifier);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final data = ref.watch(mementoFormViewModelProvider(widget.memento));
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.isNew ? 'Add Memento' : 'Edit Memento'),
        actions: [
          if (viewModel.canDelete()) ...[
            IconButton(
              tooltip: 'Delete Memento',
              onPressed: () async {
                final nav = Navigator.of(context);
                final bool result = await showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: const Text('Delete Memento?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('DELETE'),
                        ),
                      ],
                    );
                  },
                );
                if (result) {
                  await viewModel.deleteMemento();
                  nav.pop();
                }
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ],
      ),
      body: Center(
        child: ArticleWidget(
          child: Form(
            key: _formKey,
            onChanged: () {
              if (!widget.showSave) {
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  _save(context);
                });
              }
            },
            onWillPop: () async {
              final modified = viewModel.isEdited;
              if (modified) {
                return confirm(
                  context,
                  title: 'Discard changes?',
                  content: 'Are you sure you want to discard your changes?',
                );
              }
              return true;
            },
            autovalidateMode: AutovalidateMode.always,
            child: Container(
              padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        StringFormField(
                          label: 'Name',
                          value: data.name,
                          onChanged: viewModel.setName,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              maxLength: 150,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter a name.';
                                } else if (value.length > 20) {
                                  return 'Limit the name to 20 characters.';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Photo URL',
                          value: data.photo,
                          onChanged: viewModel.setPhoto,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.image),
                                labelText: 'Photo URL',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Email',
                          value: data.email,
                          onChanged: viewModel.setEmail,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Phone',
                          value: data.phone,
                          onChanged: viewModel.setPhone,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.phone),
                                labelText: 'Phone',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Context',
                          value: data.context,
                          onChanged: viewModel.setContext,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.note),
                                labelText: 'Context',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Job Title',
                          value: data.jobTitle,
                          onChanged: viewModel.setJobTitle,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.work),
                                labelText: 'Job Title',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Company',
                          value: data.company,
                          onChanged: viewModel.setCompany,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.business),
                                labelText: 'Company',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        StringFormField(
                          label: 'Birthday',
                          value: data.birthday != null ? _formatDateForDisplay(data.birthday!) : '',
                          onChanged: (value) => _handleBirthdayChange(value, viewModel),
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.cake),
                                labelText: 'Birthday (MM/DD/YYYY)',
                                hintText: '01/15/1990',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final date = _parseDate(value);
                                  if (date == null) {
                                    return 'Please enter a valid date (MM/DD/YYYY)';
                                  }
                                }
                                return null;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  if (widget.showSave) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final nav = Navigator.of(context);
                          final valid = await _save(context);
                          if (valid) nav.pop();
                        },
                        child: const Text('Save'),
                      ),
                    )
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _save(BuildContext context) async {
    final currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      await viewModel.createOrUpdateMemento();
      return true;
    }
    return false;
  }

  // Helper method to format DateTime for display in text field
  String _formatDateForDisplay(DateTime date) {
    return '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
  }

  // Helper method to handle birthday text input
  void _handleBirthdayChange(String value, MementoFormViewModel viewModel) {
    if (value.isEmpty) {
      // Don't set birthday if empty - let it remain as is
      return;
    }

    final parsedDate = _parseDate(value);
    if (parsedDate != null) {
      viewModel.setBirthday(parsedDate);
    }
  }

  // Helper method to parse date string in MM/DD/YYYY format
  DateTime? _parseDate(String value) {
    try {
      final parts = value.split('/');
      if (parts.length != 3) return null;

      final month = int.tryParse(parts[0]);
      final day = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (month == null || day == null || year == null) return null;
      if (month < 1 || month > 12) return null;
      if (day < 1 || day > 31) return null;
      if (year < 1900 || year > 2100) return null;

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }
}
