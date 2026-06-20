// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storedToken)
final storedTokenProvider = StoredTokenProvider._();

final class StoredTokenProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  StoredTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedTokenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedTokenHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return storedToken(ref);
  }
}

String _$storedTokenHash() => r'f920fb24522be10691cc29f0053c9128ed466297';
