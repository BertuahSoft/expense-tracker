import 'package:bloc/bloc.dart';
import 'package:expense_tracker/src/domain/auth/auth_contract.dart';
import 'package:expense_tracker/src/domain/auth/auth_failure.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/session/user_session_contract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthContract _contract;
  final UserSessionContract _session;
  AuthenticationCubit(this._contract, this._session)
      : super(const AuthenticationState.initial());

  void signInWithGoogle() async {
    emit(const AuthenticationState.loading());
    final failureOrSuccess = await _contract.signInWithGoogle();
    failureOrSuccess.fold(
      (l) => emit(
        AuthenticationState.failure(l),
      ),
      (r) async {
        await _saveToUserSession(r);
        emit(
          AuthenticationState.success(r),
        );
      },
    );
  }

  void signInWithFacebook() async {
    emit(const AuthenticationState.loading());
    final failureOrSuccess = await _contract.signInWithFacebook();
    failureOrSuccess.fold(
      (l) => emit(AuthenticationState.failure(l)),
      (r) async {
        await _saveToUserSession(r);
        emit(AuthenticationState.success(r));
      },
    );
  }

  Future<void> _saveToUserSession(User user) async {
    await _session.saveUserSession(user);
  }
}
