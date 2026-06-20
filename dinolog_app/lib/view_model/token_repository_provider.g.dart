// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenRepository)
final tokenRepositoryProvider = TokenRepositoryProvider._();

final class TokenRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<TokenRepository>,
          TokenRepository,
          FutureOr<TokenRepository>
        >
    with $FutureModifier<TokenRepository>, $FutureProvider<TokenRepository> {
  TokenRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<TokenRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TokenRepository> create(Ref ref) {
    return tokenRepository(ref);
  }
}

String _$tokenRepositoryHash() => r'd3150bd0523ec642c61722a154961210b1af54e1';
