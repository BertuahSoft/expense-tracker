part of 'flash_cubit.dart';

@freezed
class FlashState with _$FlashState {
  const factory FlashState.show(
      {String? title, required String message, Function? action}) = FlashShow;
  const factory FlashState.dismiss() = FlashDismiss;
}
