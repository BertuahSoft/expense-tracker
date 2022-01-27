import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'flash_state.dart';
part 'flash_cubit.freezed.dart';

@injectable
class FlashCubit extends Cubit<FlashState> {
  FlashCubit() : super(const FlashState.dismiss());
  void showSnackbar(
      {String? title, required String message, Function? action}) async {
    emit(FlashState.show(title: title, message: message, action: action));
    await Future.delayed(const Duration(seconds: 2), () {
      emit(const FlashState.dismiss());
    });
  }
}
