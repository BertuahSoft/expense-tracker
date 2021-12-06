import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/auth/value_objects.dart';
import 'package:expense_tracker/src/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

@freezed
class UserSession with _$UserSession {
  const factory UserSession({
    required String id,
    required String email,
    required String photoUrl,
    required String name,
  }) = _UserSession;
  factory UserSession.fromDomain(User user) => UserSession(
      id: user.id.getOrCrash(),
      email: user.emailAddress.getOrCrash(),
      name: user.name.getOrCrash(),
      photoUrl: user.photoUrl);
  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}

extension UserSessionX on UserSession {
  User toDomain() => User(
      id: UniqueId.fromUniqueString(id),
      emailAddress: EmailAddress(email),
      name: StringSingleLine(name),
      photoUrl: photoUrl);
}
