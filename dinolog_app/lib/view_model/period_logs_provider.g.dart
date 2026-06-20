// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(periodLogs)
final periodLogsProvider = PeriodLogsProvider._();

final class PeriodLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<LogEntries>,
          LogEntries,
          FutureOr<LogEntries>
        >
    with $FutureModifier<LogEntries>, $FutureProvider<LogEntries> {
  PeriodLogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'periodLogsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$periodLogsHash();

  @$internal
  @override
  $FutureProviderElement<LogEntries> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LogEntries> create(Ref ref) {
    return periodLogs(ref);
  }
}

String _$periodLogsHash() => r'92004d85ec3fc1ec974f028294851ce09eff3cd3';
