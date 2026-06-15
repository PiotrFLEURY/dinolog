// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_info_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ipInfoApi)
final ipInfoApiProvider = IpInfoApiProvider._();

final class IpInfoApiProvider
    extends $FunctionalProvider<IpInfoApi, IpInfoApi, IpInfoApi>
    with $Provider<IpInfoApi> {
  IpInfoApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ipInfoApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ipInfoApiHash();

  @$internal
  @override
  $ProviderElement<IpInfoApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IpInfoApi create(Ref ref) {
    return ipInfoApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IpInfoApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IpInfoApi>(value),
    );
  }
}

String _$ipInfoApiHash() => r'6ed69b3917628d255e2b691521b75527a6d3426a';
