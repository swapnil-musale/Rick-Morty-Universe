// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isCharacterFavoriteHash() =>
    r'010b3f0f4c66fe6773313895b68056d0896cd40e';

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

/// See also [isCharacterFavorite].
@ProviderFor(isCharacterFavorite)
const isCharacterFavoriteProvider = IsCharacterFavoriteFamily();

/// See also [isCharacterFavorite].
class IsCharacterFavoriteFamily extends Family<AsyncValue<bool?>> {
  /// See also [isCharacterFavorite].
  const IsCharacterFavoriteFamily();

  /// See also [isCharacterFavorite].
  IsCharacterFavoriteProvider call({
    required int id,
    required GetCharacterUseCase characterUseCase,
  }) {
    return IsCharacterFavoriteProvider(
      id: id,
      characterUseCase: characterUseCase,
    );
  }

  @override
  IsCharacterFavoriteProvider getProviderOverride(
    covariant IsCharacterFavoriteProvider provider,
  ) {
    return call(
      id: provider.id,
      characterUseCase: provider.characterUseCase,
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
  String? get name => r'isCharacterFavoriteProvider';
}

/// See also [isCharacterFavorite].
class IsCharacterFavoriteProvider extends AutoDisposeFutureProvider<bool?> {
  /// See also [isCharacterFavorite].
  IsCharacterFavoriteProvider({
    required int id,
    required GetCharacterUseCase characterUseCase,
  }) : this._internal(
          (ref) => isCharacterFavorite(
            ref as IsCharacterFavoriteRef,
            id: id,
            characterUseCase: characterUseCase,
          ),
          from: isCharacterFavoriteProvider,
          name: r'isCharacterFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isCharacterFavoriteHash,
          dependencies: IsCharacterFavoriteFamily._dependencies,
          allTransitiveDependencies:
              IsCharacterFavoriteFamily._allTransitiveDependencies,
          id: id,
          characterUseCase: characterUseCase,
        );

  IsCharacterFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.characterUseCase,
  }) : super.internal();

  final int id;
  final GetCharacterUseCase characterUseCase;

  @override
  Override overrideWith(
    FutureOr<bool?> Function(IsCharacterFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsCharacterFavoriteProvider._internal(
        (ref) => create(ref as IsCharacterFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        characterUseCase: characterUseCase,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool?> createElement() {
    return _IsCharacterFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsCharacterFavoriteProvider &&
        other.id == id &&
        other.characterUseCase == characterUseCase;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, characterUseCase.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsCharacterFavoriteRef on AutoDisposeFutureProviderRef<bool?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `characterUseCase` of this provider.
  GetCharacterUseCase get characterUseCase;
}

class _IsCharacterFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<bool?>
    with IsCharacterFavoriteRef {
  _IsCharacterFavoriteProviderElement(super.provider);

  @override
  int get id => (origin as IsCharacterFavoriteProvider).id;
  @override
  GetCharacterUseCase get characterUseCase =>
      (origin as IsCharacterFavoriteProvider).characterUseCase;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
