import 'package:bloc/bloc.dart';
import 'package:expense_tracker/src/domain/auth/auth_contract.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'package:injectable/injectable.dart';

part 'auth_status_state.dart';
part 'auth_status_cubit.freezed.dart';

@injectable
class AuthStatusCubit extends Cubit<AuthStatusState> {
  final AuthContract _contract;
  StreamSubscription? _streamSubscription;
  AuthStatusCubit(this._contract) : super(const AuthStatusState.initial()) {
    _monitorAuthStatus();
  }

  StreamSubscription<User?> _monitorAuthStatus() {
    return _streamSubscription = _contract.getSignedInUser().listen((user) {
      if (user != null) {
        _emitAuthenticated(user);
      } else {
        _emitUnauthenticated();
      }
    });
  }

  void _emitAuthenticated(User user) {
    emit(AuthStatusState.authenticated(user));
  }

  void _emitUnauthenticated() => emit(const AuthStatusState.unauthenticated());

  void signedOut() async {
    await _contract.signOut();
    _emitUnauthenticated();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
