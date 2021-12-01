import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:expense_tracker/src/domain/auth/auth_contract.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/auth/auth_failure.dart';
import 'package:expense_tracker/src/infrastructure/auth/firebase_user_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthContract)
class AuthRepository implements AuthContract {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirebaseUserMapper _firebaseUserMapper;

  AuthRepository(this._firebaseAuth, this._googleSignIn, this._facebookAuth,
      this._firebaseUserMapper);

  @override
  Stream<User?> getSignedInUser() => _firebaseAuth.authStateChanges().map(
      (user) => (user != null) ? _firebaseUserMapper.toDomain(user) : null);

  @override
  Future<Either<AuthFailure, User>> signInWithFacebook() async {
    try {
      final facebookUser = await _facebookAuth.login();
      if (facebookUser.status == LoginStatus.cancelled) {
        return left(const AuthFailure.cancelledByUser());
      } else if (facebookUser.status == LoginStatus.success) {
        final credential = firebase_auth.FacebookAuthProvider.credential(
            facebookUser.accessToken!.token);

        return _firebaseAuth
            .signInWithCredential(credential)
            .then((value) => right(_firebaseUserMapper.toDomain(value.user!)));
      }
      throw firebase_auth.FirebaseAuthException(code: "cannot-login-facebook");
    } on firebase_auth.FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, User>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(_firebaseUserMapper.toDomain(r.user!)));
    } on firebase_auth.FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _facebookAuth.logOut(),
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}
