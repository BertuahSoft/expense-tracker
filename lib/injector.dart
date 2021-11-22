import 'package:expense_tracker/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String environment) async {
  $initGetIt(getIt, environment: environment);
}
