// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_endpoints_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topEndpoints)
final topEndpointsProvider = TopEndpointsProvider._();

final class TopEndpointsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TopEndpoint>>,
          List<TopEndpoint>,
          FutureOr<List<TopEndpoint>>
        >
    with
        $FutureModifier<List<TopEndpoint>>,
        $FutureProvider<List<TopEndpoint>> {
  TopEndpointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topEndpointsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topEndpointsHash();

  @$internal
  @override
  $FutureProviderElement<List<TopEndpoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TopEndpoint>> create(Ref ref) {
    return topEndpoints(ref);
  }
}

String _$topEndpointsHash() => r'5790803e2047b84ec16b2571df5040a23f331abf';
