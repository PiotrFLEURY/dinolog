// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomDio)
final customDioProvider = CustomDioProvider._();

final class CustomDioProvider extends $AsyncNotifierProvider<CustomDio, Dio> {
  CustomDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customDioHash();

  @$internal
  @override
  CustomDio create() => CustomDio();
}

String _$customDioHash() => r'd17658d9683f999af918ef5739342e319e409545';

abstract class _$CustomDio extends $AsyncNotifier<Dio> {
  FutureOr<Dio> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Dio>, Dio>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Dio>, Dio>,
              AsyncValue<Dio>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
