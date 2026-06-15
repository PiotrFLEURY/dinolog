// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paginatedLogs)
final paginatedLogsProvider = PaginatedLogsFamily._();

final class PaginatedLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginatedLogs>,
          PaginatedLogs,
          FutureOr<PaginatedLogs>
        >
    with $FutureModifier<PaginatedLogs>, $FutureProvider<PaginatedLogs> {
  PaginatedLogsProvider._({
    required PaginatedLogsFamily super.from,
    required ({int page, int pageSize, String? status, String? method})
    super.argument,
  }) : super(
         retry: null,
         name: r'paginatedLogsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginatedLogsHash();

  @override
  String toString() {
    return r'paginatedLogsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginatedLogs> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginatedLogs> create(Ref ref) {
    final argument =
        this.argument
            as ({int page, int pageSize, String? status, String? method});
    return paginatedLogs(
      ref,
      page: argument.page,
      pageSize: argument.pageSize,
      status: argument.status,
      method: argument.method,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedLogsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedLogsHash() => r'55a4c80e9f928d2ebee88143b9d39d8cdd17ccc3';

final class PaginatedLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginatedLogs>,
          ({int page, int pageSize, String? status, String? method})
        > {
  PaginatedLogsFamily._()
    : super(
        retry: null,
        name: r'paginatedLogsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginatedLogsProvider call({
    required int page,
    required int pageSize,
    required String? status,
    required String? method,
  }) => PaginatedLogsProvider._(
    argument: (page: page, pageSize: pageSize, status: status, method: method),
    from: this,
  );

  @override
  String toString() => r'paginatedLogsProvider';
}
