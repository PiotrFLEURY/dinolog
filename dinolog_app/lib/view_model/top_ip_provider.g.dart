// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_ip_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topIp)
final topIpProvider = TopIpProvider._();

final class TopIpProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TopIp>>,
          List<TopIp>,
          FutureOr<List<TopIp>>
        >
    with $FutureModifier<List<TopIp>>, $FutureProvider<List<TopIp>> {
  TopIpProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topIpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topIpHash();

  @$internal
  @override
  $FutureProviderElement<List<TopIp>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TopIp>> create(Ref ref) {
    return topIp(ref);
  }
}

String _$topIpHash() => r'27e515dcc63184a91c8a44cd04fd43ddca138e77';
