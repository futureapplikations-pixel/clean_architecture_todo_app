// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_todo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteTodoUseCaseImplHash() =>
    r'7344ec2a407037f5b023ebe48f695705b84be012';

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

abstract class _$DeleteTodoUseCaseImpl
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int id;

  FutureOr<void> build(
    int id,
  );
}

/// See also [DeleteTodoUseCaseImpl].
@ProviderFor(DeleteTodoUseCaseImpl)
const deleteTodoUseCaseImplProvider = DeleteTodoUseCaseImplFamily();

/// See also [DeleteTodoUseCaseImpl].
class DeleteTodoUseCaseImplFamily extends Family<AsyncValue<void>> {
  /// See also [DeleteTodoUseCaseImpl].
  const DeleteTodoUseCaseImplFamily();

  /// See also [DeleteTodoUseCaseImpl].
  DeleteTodoUseCaseImplProvider call(
    int id,
  ) {
    return DeleteTodoUseCaseImplProvider(
      id,
    );
  }

  @override
  DeleteTodoUseCaseImplProvider getProviderOverride(
    covariant DeleteTodoUseCaseImplProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deleteTodoUseCaseImplProvider';
}

/// See also [DeleteTodoUseCaseImpl].
class DeleteTodoUseCaseImplProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DeleteTodoUseCaseImpl, void> {
  /// See also [DeleteTodoUseCaseImpl].
  DeleteTodoUseCaseImplProvider(
    int id,
  ) : this._internal(
          () => DeleteTodoUseCaseImpl()..id = id,
          from: deleteTodoUseCaseImplProvider,
          name: r'deleteTodoUseCaseImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteTodoUseCaseImplHash,
          dependencies: DeleteTodoUseCaseImplFamily._dependencies,
          allTransitiveDependencies:
              DeleteTodoUseCaseImplFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteTodoUseCaseImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<void> runNotifierBuild(
    covariant DeleteTodoUseCaseImpl notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DeleteTodoUseCaseImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeleteTodoUseCaseImplProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DeleteTodoUseCaseImpl, void>
      createElement() {
    return _DeleteTodoUseCaseImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTodoUseCaseImplProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteTodoUseCaseImplRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteTodoUseCaseImplProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DeleteTodoUseCaseImpl, void>
    with DeleteTodoUseCaseImplRef {
  _DeleteTodoUseCaseImplProviderElement(super.provider);

  @override
  int get id => (origin as DeleteTodoUseCaseImplProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
