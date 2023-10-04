// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isCharacterFavoriteHash() =>
    r'6631858d9f1f8f73e9dea0e3a86f79936d1caa08';

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
    required int characterId,
  }) {
    return IsCharacterFavoriteProvider(
      characterId: characterId,
    );
  }

  @override
  IsCharacterFavoriteProvider getProviderOverride(
    covariant IsCharacterFavoriteProvider provider,
  ) {
    return call(
      characterId: provider.characterId,
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
    required int characterId,
  }) : this._internal(
          (ref) => isCharacterFavorite(
            ref as IsCharacterFavoriteRef,
            characterId: characterId,
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
          characterId: characterId,
        );

  IsCharacterFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.characterId,
  }) : super.internal();

  final int characterId;

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
        characterId: characterId,
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
        other.characterId == characterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, characterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsCharacterFavoriteRef on AutoDisposeFutureProviderRef<bool?> {
  /// The parameter `characterId` of this provider.
  int get characterId;
}

class _IsCharacterFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<bool?>
    with IsCharacterFavoriteRef {
  _IsCharacterFavoriteProviderElement(super.provider);

  @override
  int get characterId => (origin as IsCharacterFavoriteProvider).characterId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
