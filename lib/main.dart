import 'dart:async';
import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/core/utils/expense_bloc_observer.dart';
import 'package:expense_tracker/src/core/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  String env = FlutterConfig.get('ENV').toString();
  configureInjection(env);
  final firebaseCrashlytics = getIt<FirebaseCrashlytics>();

  runZonedGuarded<Future<void>>(() async {
    BlocOverrides.runZoned(() {
      final overrides = BlocOverrides.current;
    }, blocObserver: ExpenseBlocObserver());

    await Firebase.initializeApp();

    //catch flutter error
    FlutterError.onError = (FlutterErrorDetails details) {
      if (env == 'dev') {
        FlutterError.dumpErrorToConsole(details);
      } else {
        firebaseCrashlytics.recordFlutterError(details);
      }
    };
    runApp(const ExpenseTrackerApp());
  }, (error, stacktrace) {
    logger.e("runGuardedZone: Caught Error in root zone");
    firebaseCrashlytics.recordError(error, stacktrace);
  });
}
