part of 'auth_status_cubit.dart';

@freezed
class AuthStatusState with _$AuthStatusState {
  const factory AuthStatusState.initial() = Initial;
  const factory AuthStatusState.authenticated(User user) = Authenticated;
  const factory AuthStatusState.unauthenticated() = Unauthenticated;
}
