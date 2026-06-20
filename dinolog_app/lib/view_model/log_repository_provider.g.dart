// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logRepository)
final logRepositoryProvider = LogRepositoryProvider._();

final class LogRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<LogRepository>,
          LogRepository,
          FutureOr<LogRepository>
        >
    with $FutureModifier<LogRepository>, $FutureProvider<LogRepository> {
  LogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<LogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LogRepository> create(Ref ref) {
    return logRepository(ref);
  }
}

String _$logRepositoryHash() => r'ffd909483f2961ce543c7e7609470ffbebd875b0';
