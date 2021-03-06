import 'package:bloc/bloc.dart';
import 'package:expense_tracker/src/core/utils/logger.dart';
import 'package:expense_tracker/src/domain/auth/auth_contract.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/session/user_session_contract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'package:injectable/injectable.dart';

part 'auth_status_state.dart';
part 'auth_status_cubit.freezed.dart';

@injectable
class AuthStatusCubit extends Cubit<AuthStatusState> {
  final AuthContract _contract;
  final UserSessionContract _session;
  AuthStatusCubit(this._contract, this._session)
      : super(const AuthStatusState.initial());
  void _emitUnauthenticated() => emit(const AuthStatusState.unauthenticated());

  void getAuthenticatedUser() async {
    final user = await _session.getUserSession();
    user.fold((l) => emit(const AuthStatusState.unauthenticated()),
        (r) => emit(AuthStatusState.authenticated(r)));
  }

  void signedOut() async {
    await _session.deleteUserSession();
    await _contract.signOut();
    _emitUnauthenticated();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
