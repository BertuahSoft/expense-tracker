import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = AuthCancelledByUser;
  const factory AuthFailure.serverError() = AuthServerFailure;
}
