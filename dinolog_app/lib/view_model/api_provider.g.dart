// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dinologApi)
final dinologApiProvider = DinologApiProvider._();

final class DinologApiProvider
    extends $FunctionalProvider<DinologApi, DinologApi, DinologApi>
    with $Provider<DinologApi> {
  DinologApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dinologApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dinologApiHash();

  @$internal
  @override
  $ProviderElement<DinologApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DinologApi create(Ref ref) {
    return dinologApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DinologApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DinologApi>(value),
    );
  }
}

String _$dinologApiHash() => r'2a1feb8da881f3819a2ba4b517c6be57e8f940bd';
