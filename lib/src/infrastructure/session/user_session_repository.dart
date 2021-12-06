import 'package:expense_tracker/src/domain/core/error/failures.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:dartz/dartz.dart';
import 'package:expense_tracker/src/domain/session/user_session_contract.dart';
import 'package:expense_tracker/src/infrastructure/session/user_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:expense_tracker/src/infrastructure/session/model/user_session.dart';

@LazySingleton(as: UserSessionContract)
class UserSessionRepository implements UserSessionContract {
  final UserPreference _userPreference;
  UserSessionRepository(this._userPreference);
  @override
  Future<Either<LocalFailure, Unit>> deleteUserSession() async {
    try {
      await _userPreference.deleteData();
      return right(unit);
    } catch (obj) {
      return left(LocalFailure(message: obj.toString()));
    }
  }

  @override
  Future<Either<LocalFailure, User>> getUserSession() async {
    try {
      final userData = await _userPreference.getData();
      if (userData != null) {
        return right(userData.toDomain());
      }
      return left(LocalFailure(message: "Your session is expired"));
    } catch (obj) {
      return left(LocalFailure(message: obj.toString()));
    }
  }

  @override
  Future<Either<LocalFailure, Unit>> saveUserSession(User user) async {
    try {
      await _userPreference.setData(UserSession.fromDomain(user));
      return right(unit);
    } catch (obj) {
      return left(LocalFailure(message: obj.toString()));
    }
  }
}
