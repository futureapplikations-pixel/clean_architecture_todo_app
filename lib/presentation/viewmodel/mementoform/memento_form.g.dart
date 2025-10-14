// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memento_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mementoFormViewModelHash() =>
    r'a3cbf00db236788079692dfd7431b300ed5e67cf';

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

abstract class _$MementoFormViewModel
    extends BuildlessAutoDisposeNotifier<FormData> {
  late final Memento? memento;

  FormData build(
    Memento? memento,
  );
}

/// See also [MementoFormViewModel].
@ProviderFor(MementoFormViewModel)
const mementoFormViewModelProvider = MementoFormViewModelFamily();

/// See also [MementoFormViewModel].
class MementoFormViewModelFamily extends Family<FormData> {
  /// See also [MementoFormViewModel].
  const MementoFormViewModelFamily();

  /// See also [MementoFormViewModel].
  MementoFormViewModelProvider call(
    Memento? memento,
  ) {
    return MementoFormViewModelProvider(
      memento,
    );
  }

  @override
  MementoFormViewModelProvider getProviderOverride(
    covariant MementoFormViewModelProvider provider,
  ) {
    return call(
      provider.memento,
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
  String? get name => r'mementoFormViewModelProvider';
}

/// See also [MementoFormViewModel].
class MementoFormViewModelProvider
    extends AutoDisposeNotifierProviderImpl<MementoFormViewModel, FormData> {
  /// See also [MementoFormViewModel].
  MementoFormViewModelProvider(
    Memento? memento,
  ) : this._internal(
          () => MementoFormViewModel()..memento = memento,
          from: mementoFormViewModelProvider,
          name: r'mementoFormViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mementoFormViewModelHash,
          dependencies: MementoFormViewModelFamily._dependencies,
          allTransitiveDependencies:
              MementoFormViewModelFamily._allTransitiveDependencies,
          memento: memento,
        );

  MementoFormViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memento,
  }) : super.internal();

  final Memento? memento;

  @override
  FormData runNotifierBuild(
    covariant MementoFormViewModel notifier,
  ) {
    return notifier.build(
      memento,
    );
  }

  @override
  Override overrideWith(MementoFormViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MementoFormViewModelProvider._internal(
        () => create()..memento = memento,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memento: memento,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MementoFormViewModel, FormData>
      createElement() {
    return _MementoFormViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MementoFormViewModelProvider && other.memento == memento;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memento.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MementoFormViewModelRef on AutoDisposeNotifierProviderRef<FormData> {
  /// The parameter `memento` of this provider.
  Memento? get memento;
}

class _MementoFormViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<MementoFormViewModel, FormData>
    with MementoFormViewModelRef {
  _MementoFormViewModelProviderElement(super.provider);

  @override
  Memento? get memento => (origin as MementoFormViewModelProvider).memento;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
