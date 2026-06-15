// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_code_repartition_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(statusCodeRepartition)
final statusCodeRepartitionProvider = StatusCodeRepartitionProvider._();

final class StatusCodeRepartitionProvider
    extends
        $FunctionalProvider<
          AsyncValue<StatusCodeRepartition>,
          StatusCodeRepartition,
          FutureOr<StatusCodeRepartition>
        >
    with
        $FutureModifier<StatusCodeRepartition>,
        $FutureProvider<StatusCodeRepartition> {
  StatusCodeRepartitionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statusCodeRepartitionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statusCodeRepartitionHash();

  @$internal
  @override
  $FutureProviderElement<StatusCodeRepartition> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StatusCodeRepartition> create(Ref ref) {
    return statusCodeRepartition(ref);
  }
}

String _$statusCodeRepartitionHash() =>
    r'69d63875a762b13f809bca63f6e59497743426d7';
