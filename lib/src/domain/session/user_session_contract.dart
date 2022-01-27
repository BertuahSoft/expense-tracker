import 'package:dartz/dartz.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/core/error/failures.dart';

abstract class UserSessionContract {
  Future<Either<LocalFailure, User>> getUserSession();
  Future<Either<LocalFailure, Unit>> saveUserSession(User user);
  Future<Either<LocalFailure, Unit>> deleteUserSession();
}
