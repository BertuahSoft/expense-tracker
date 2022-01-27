import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/auth/value_objects.dart';
import 'package:expense_tracker/src/domain/core/value_object.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

@lazySingleton
class FirebaseUserMapper {
  User toDomain(firebase_auth.User _) {
    final name = _.displayName ?? _.email!.split('@').first;
    final regexName = name.replaceAll(RegExp(' +'), ' ');
    return User(
        id: UniqueId.fromUniqueString(_.uid),
        name: StringSingleLine(name),
        emailAddress: EmailAddress(_.email!),
        photoUrl: _.photoURL ??
            "https://ui-avatars.com/api/?name=${regexName}background=random");
  }
}
