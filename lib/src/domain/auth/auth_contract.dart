import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:expense_tracker/src/domain/auth/auth_failure.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';

abstract class AuthContract {
  Stream<User?> getSignedInUser();
  Future<Either<AuthFailure, User>> signInWithGoogle();
  Future<Either<AuthFailure, User>> signInWithFacebook();
  Future<void> signOut();
}
