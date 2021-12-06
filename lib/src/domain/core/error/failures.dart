import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message}) : super([message]);
  @override
  List<Object?> get props => [message];
}

class LocalFailure extends Failure {
  final String message;
  LocalFailure({required this.message}) : super([message]);
  @override
  List<Object?> get props => [message];
}
