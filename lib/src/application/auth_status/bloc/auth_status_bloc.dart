import 'package:bloc/bloc.dart';
import 'package:expense_tracker/src/domain/auth/auth_contract.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';
part 'auth_status_bloc.freezed.dart';

@injectable
class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  final AuthContract _contract;
  AuthStatusBloc(this._contract) : super(const AuthStatusState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await _contract.getSignedInUser();
      emit(userOption.fold(() => const AuthStatusState.unauthenticated(),
          (user) => AuthStatusState.authenticated(user)));
    });

    on<SignedOut>((event, emit) async {
      await _contract.signOut();
      emit(const AuthStatusState.unauthenticated());
    });
  }
}
