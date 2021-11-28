import 'package:dartz/dartz.dart';
import 'package:expense_tracker/src/domain/auth/value_objects.dart';
import 'package:expense_tracker/src/domain/core/error/value_failure.dart';
import 'package:expense_tracker/src/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User(
      {required UniqueId id,
      required StringSingleLine name,
      required EmailAddress emailAddress,
      required String photoUrl}) = _User;
}

extension UserX on User {
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(emailAddress.failureOrUnit)
        .fold((l) => some(l), (r) => none());
  }
}
