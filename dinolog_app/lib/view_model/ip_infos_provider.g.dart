// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_infos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ipInfos)
final ipInfosProvider = IpInfosFamily._();

final class IpInfosProvider
    extends $FunctionalProvider<AsyncValue<IpInfos>, IpInfos, FutureOr<IpInfos>>
    with $FutureModifier<IpInfos>, $FutureProvider<IpInfos> {
  IpInfosProvider._({
    required IpInfosFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ipInfosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ipInfosHash();

  @override
  String toString() {
    return r'ipInfosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<IpInfos> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<IpInfos> create(Ref ref) {
    final argument = this.argument as String;
    return ipInfos(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IpInfosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ipInfosHash() => r'f126a372fece46726010e6186e5831e439b8f993';

final class IpInfosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<IpInfos>, String> {
  IpInfosFamily._()
    : super(
        retry: null,
        name: r'ipInfosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IpInfosProvider call(String ip) =>
      IpInfosProvider._(argument: ip, from: this);

  @override
  String toString() => r'ipInfosProvider';
}
