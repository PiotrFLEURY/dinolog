// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_period_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedPeriod)
final selectedPeriodProvider = SelectedPeriodProvider._();

final class SelectedPeriodProvider
    extends $NotifierProvider<SelectedPeriod, SelectedPeriodEnum> {
  SelectedPeriodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedPeriodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedPeriodHash();

  @$internal
  @override
  SelectedPeriod create() => SelectedPeriod();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectedPeriodEnum value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectedPeriodEnum>(value),
    );
  }
}

String _$selectedPeriodHash() => r'e55a806bf32d4718f64a780c67637fde54611d02';

abstract class _$SelectedPeriod extends $Notifier<SelectedPeriodEnum> {
  SelectedPeriodEnum build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SelectedPeriodEnum, SelectedPeriodEnum>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SelectedPeriodEnum, SelectedPeriodEnum>,
              SelectedPeriodEnum,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
