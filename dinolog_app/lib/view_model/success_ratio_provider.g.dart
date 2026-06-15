// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_ratio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(successRatio)
final successRatioProvider = SuccessRatioProvider._();

final class SuccessRatioProvider
    extends
        $FunctionalProvider<
          AsyncValue<SuccessRatio>,
          SuccessRatio,
          FutureOr<SuccessRatio>
        >
    with $FutureModifier<SuccessRatio>, $FutureProvider<SuccessRatio> {
  SuccessRatioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'successRatioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$successRatioHash();

  @$internal
  @override
  $FutureProviderElement<SuccessRatio> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SuccessRatio> create(Ref ref) {
    return successRatio(ref);
  }
}

String _$successRatioHash() => r'6d4c52b3409e77ce5b3c2dffae0fa02b481fed0f';
