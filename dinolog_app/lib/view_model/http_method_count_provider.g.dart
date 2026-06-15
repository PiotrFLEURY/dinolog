// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_method_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(httpMethodCount)
final httpMethodCountProvider = HttpMethodCountProvider._();

final class HttpMethodCountProvider
    extends
        $FunctionalProvider<
          AsyncValue<HttpMethodCount>,
          HttpMethodCount,
          FutureOr<HttpMethodCount>
        >
    with $FutureModifier<HttpMethodCount>, $FutureProvider<HttpMethodCount> {
  HttpMethodCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpMethodCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpMethodCountHash();

  @$internal
  @override
  $FutureProviderElement<HttpMethodCount> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HttpMethodCount> create(Ref ref) {
    return httpMethodCount(ref);
  }
}

String _$httpMethodCountHash() => r'87f6ec74916bf6991cc3cd9eaa6227df50deda98';
