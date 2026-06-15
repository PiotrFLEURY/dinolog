// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(timeline)
final timelineProvider = TimelineProvider._();

final class TimelineProvider
    extends
        $FunctionalProvider<AsyncValue<Timeline>, Timeline, FutureOr<Timeline>>
    with $FutureModifier<Timeline>, $FutureProvider<Timeline> {
  TimelineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timelineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timelineHash();

  @$internal
  @override
  $FutureProviderElement<Timeline> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Timeline> create(Ref ref) {
    return timeline(ref);
  }
}

String _$timelineHash() => r'e8750f91357f306a692d905d7020a8d974e6c063';
