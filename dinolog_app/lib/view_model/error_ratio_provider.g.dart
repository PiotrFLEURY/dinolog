// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_ratio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(errorRatio)
final errorRatioProvider = ErrorRatioProvider._();

final class ErrorRatioProvider
    extends
        $FunctionalProvider<
          AsyncValue<ErrorRatio>,
          ErrorRatio,
          FutureOr<ErrorRatio>
        >
    with $FutureModifier<ErrorRatio>, $FutureProvider<ErrorRatio> {
  ErrorRatioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorRatioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorRatioHash();

  @$internal
  @override
  $FutureProviderElement<ErrorRatio> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ErrorRatio> create(Ref ref) {
    return errorRatio(ref);
  }
}

String _$errorRatioHash() => r'51303ec6d7dbf5a77f8822600b3557358f4ea6cd';
