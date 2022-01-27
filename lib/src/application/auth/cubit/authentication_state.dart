part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loading() = AuthenticationLoading;
  const factory AuthenticationState.success(User user) = AuthenticationSuccess;
  const factory AuthenticationState.failure(AuthFailure failure) =
      AuthenticationFailure;
}
