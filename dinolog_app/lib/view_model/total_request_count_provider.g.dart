// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_request_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(totalRequestCount)
final totalRequestCountProvider = TotalRequestCountProvider._();

final class TotalRequestCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  TotalRequestCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalRequestCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalRequestCountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalRequestCount(ref);
  }
}

String _$totalRequestCountHash() => r'7a0578995c2b516e7f1f248fdace9c202c90d992';
