// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_memento_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMementoListViewModelHash() =>
    r'1bb59545065e35a1e6acb296b5bbed95397da832';

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

abstract class _$SearchMementoListViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<Memento>> {
  late final String query;

  FutureOr<List<Memento>> build(
    String query,
  );
}

/// See also [SearchMementoListViewModel].
@ProviderFor(SearchMementoListViewModel)
const searchMementoListViewModelProvider = SearchMementoListViewModelFamily();

/// See also [SearchMementoListViewModel].
class SearchMementoListViewModelFamily
    extends Family<AsyncValue<List<Memento>>> {
  /// See also [SearchMementoListViewModel].
  const SearchMementoListViewModelFamily();

  /// See also [SearchMementoListViewModel].
  SearchMementoListViewModelProvider call(
    String query,
  ) {
    return SearchMementoListViewModelProvider(
      query,
    );
  }

  @override
  SearchMementoListViewModelProvider getProviderOverride(
    covariant SearchMementoListViewModelProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchMementoListViewModelProvider';
}

/// See also [SearchMementoListViewModel].
class SearchMementoListViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchMementoListViewModel,
        List<Memento>> {
  /// See also [SearchMementoListViewModel].
  SearchMementoListViewModelProvider(
    String query,
  ) : this._internal(
          () => SearchMementoListViewModel()..query = query,
          from: searchMementoListViewModelProvider,
          name: r'searchMementoListViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMementoListViewModelHash,
          dependencies: SearchMementoListViewModelFamily._dependencies,
          allTransitiveDependencies:
              SearchMementoListViewModelFamily._allTransitiveDependencies,
          query: query,
        );

  SearchMementoListViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<Memento>> runNotifierBuild(
    covariant SearchMementoListViewModel notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SearchMementoListViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchMementoListViewModelProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchMementoListViewModel,
      List<Memento>> createElement() {
    return _SearchMementoListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMementoListViewModelProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchMementoListViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<Memento>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchMementoListViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchMementoListViewModel,
        List<Memento>> with SearchMementoListViewModelRef {
  _SearchMementoListViewModelProviderElement(super.provider);

  @override
  String get query => (origin as SearchMementoListViewModelProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
