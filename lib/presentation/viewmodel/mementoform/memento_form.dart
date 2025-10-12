import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/memento.dart';
import '../mementolist/memento_list.dart';

part 'memento_form.g.dart';

typedef FormData = Map<String, dynamic>;

@riverpod
class MementoFormViewModel extends _$MementoFormViewModel {
  late final MementoListViewModel mementoListViewModel =
      ref.watch(mementoListViewModelProvider.notifier);
  FormData _formData = {};
  bool _edited = false;

  bool get isNew => _formData.id == null;
  bool get isEdited => _edited;

  @override
  FormData build(Memento? memento) {
    return _formData = {
      'id': memento?.id,
      'name': memento?.name,
      'photo': memento?.photo,
      'email': memento?.email,
      'phone': memento?.phone,
      'context': memento?.context,
      'jobTitle': memento?.jobTitle,
      'company': memento?.company,
      'birthday': memento?.birthday,
    };
  }

  Future<void> createOrUpdateMemento() {
    final id = _formData.id;
    final name = _formData.name;

    if (name == null) {
      throw Exception('Name is null');
    }

    if (!isNew) {
      return mementoListViewModel.updateMemento(
        id!,
        name: name,
        photo: _formData.photo,
        email: _formData.email,
        phone: _formData.phone,
        context: _formData.context,
        jobTitle: _formData.jobTitle,
        company: _formData.company,
        birthday: _formData.birthday,
      );
    } else {
      return mementoListViewModel.addMemento(
        name: name,
        photo: _formData.photo,
        email: _formData.email,
        phone: _formData.phone,
        context: _formData.context,
        jobTitle: _formData.jobTitle,
        company: _formData.company,
        birthday: _formData.birthday,
      );
    }
  }

  Future<void> deleteMemento() async {
    if (isNew) return;
    final id = _formData.id;
    return mementoListViewModel.deleteMemento(id!);
  }

  bool canDelete() => !isNew;

  void setName(String value) {
    _formData['name'] = value;
    _edited = true;
    state = _formData;
  }

  void setPhoto(String value) {
    _formData['photo'] = value;
    _edited = true;
    state = _formData;
  }

  void setEmail(String value) {
    _formData['email'] = value;
    _edited = true;
    state = _formData;
  }

  void setPhone(String value) {
    _formData['phone'] = value;
    _edited = true;
    state = _formData;
  }

  void setContext(String value) {
    _formData['context'] = value;
    _edited = true;
    state = _formData;
  }

  void setJobTitle(String value) {
    _formData['jobTitle'] = value;
    _edited = true;
    state = _formData;
  }

  void setCompany(String value) {
    _formData['company'] = value;
    _edited = true;
    state = _formData;
  }

  void setBirthday(DateTime value) {
    _formData['birthday'] = value;
    _edited = true;
    state = _formData;
  }
}

extension DateUtils on DateTime {
  DateTime get pickerStartDate => DateTime(year - 100, 1, 1);
  DateTime get pickerEndDate => DateTime.now();
}

extension FormDataUtils on FormData {
  int? get id => this['id'];
  String? get name => this['name'];
  String? get photo => this['photo'];
  String? get email => this['email'];
  String? get phone => this['phone'];
  String? get context => this['context'];
  String? get jobTitle => this['jobTitle'];
  String? get company => this['company'];
  DateTime? get birthday => this['birthday'];
}
