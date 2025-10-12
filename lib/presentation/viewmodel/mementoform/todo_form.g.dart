// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoFormViewModelHash() => r'2c6c947c08ae6da9379001e27eb20308d704c33e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TodoFormViewModel
    extends BuildlessAutoDisposeNotifier<FormData> {
  late final Todo? todo;

  FormData build(
    Todo? todo,
  );
}

/// See also [TodoFormViewModel].
@ProviderFor(TodoFormViewModel)
const todoFormViewModelProvider = TodoFormViewModelFamily();

/// See also [TodoFormViewModel].
class TodoFormViewModelFamily extends Family<FormData> {
  /// See also [TodoFormViewModel].
  const TodoFormViewModelFamily();

  /// See also [TodoFormViewModel].
  TodoFormViewModelProvider call(
    Todo? todo,
  ) {
    return TodoFormViewModelProvider(
      todo,
    );
  }

  @override
  TodoFormViewModelProvider getProviderOverride(
    covariant TodoFormViewModelProvider provider,
  ) {
    return call(
      provider.todo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoFormViewModelProvider';
}

/// See also [TodoFormViewModel].
class TodoFormViewModelProvider
    extends AutoDisposeNotifierProviderImpl<TodoFormViewModel, FormData> {
  /// See also [TodoFormViewModel].
  TodoFormViewModelProvider(
    Todo? todo,
  ) : this._internal(
          () => TodoFormViewModel()..todo = todo,
          from: todoFormViewModelProvider,
          name: r'todoFormViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todoFormViewModelHash,
          dependencies: TodoFormViewModelFamily._dependencies,
          allTransitiveDependencies:
              TodoFormViewModelFamily._allTransitiveDependencies,
          todo: todo,
        );

  TodoFormViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todo,
  }) : super.internal();

  final Todo? todo;

  @override
  FormData runNotifierBuild(
    covariant TodoFormViewModel notifier,
  ) {
    return notifier.build(
      todo,
    );
  }

  @override
  Override overrideWith(TodoFormViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoFormViewModelProvider._internal(
        () => create()..todo = todo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todo: todo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TodoFormViewModel, FormData>
      createElement() {
    return _TodoFormViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoFormViewModelProvider && other.todo == todo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TodoFormViewModelRef on AutoDisposeNotifierProviderRef<FormData> {
  /// The parameter `todo` of this provider.
  Todo? get todo;
}

class _TodoFormViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<TodoFormViewModel, FormData>
    with TodoFormViewModelRef {
  _TodoFormViewModelProviderElement(super.provider);

  @override
  Todo? get todo => (origin as TodoFormViewModelProvider).todo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
