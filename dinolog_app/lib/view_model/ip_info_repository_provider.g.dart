// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_info_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ipInfosRepository)
final ipInfosRepositoryProvider = IpInfosRepositoryProvider._();

final class IpInfosRepositoryProvider
    extends
        $FunctionalProvider<
          IpInfosRepository,
          IpInfosRepository,
          IpInfosRepository
        >
    with $Provider<IpInfosRepository> {
  IpInfosRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ipInfosRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ipInfosRepositoryHash();

  @$internal
  @override
  $ProviderElement<IpInfosRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IpInfosRepository create(Ref ref) {
    return ipInfosRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IpInfosRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IpInfosRepository>(value),
    );
  }
}

String _$ipInfosRepositoryHash() => r'143a5e24b5356f2090c8ebad5a8cf1644a315e47';
