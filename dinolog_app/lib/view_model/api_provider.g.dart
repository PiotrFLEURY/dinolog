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
    extends
        $FunctionalProvider<
          AsyncValue<DinologApi>,
          DinologApi,
          FutureOr<DinologApi>
        >
    with $FutureModifier<DinologApi>, $FutureProvider<DinologApi> {
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
  $FutureProviderElement<DinologApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DinologApi> create(Ref ref) {
    return dinologApi(ref);
  }
}

String _$dinologApiHash() => r'582fd1c7d7a0bba28ff204ab6920316a07b71f9b';
