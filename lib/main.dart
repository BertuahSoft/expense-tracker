import 'dart:async';
import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/core/utils/expense_bloc_observer.dart';
import 'package:expense_tracker/src/core/utils/helper.dart';
import 'package:expense_tracker/src/core/utils/logger.dart';
import 'package:expense_tracker/src/infrastructure/core/fcm_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';

import 'src/app.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await FlutterConfig.loadEnvVariables();
    String env = FlutterConfig.get('ENV').toString();
    configureInjection(env);
    await Firebase.initializeApp();
    await FcmService.listenNotification();

    final firebaseCrashlytics = getIt<FirebaseCrashlytics>();
    BlocOverrides.runZoned(() {
      // final overrides = BlocOverrides.current;
    }, blocObserver: ExpenseBlocObserver());

    //catch flutter error
    FlutterError.onError = (FlutterErrorDetails details) {
      if (!isProduction) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        firebaseCrashlytics.recordFlutterError(details);
      }
    };
    Paint.enableDithering = true;
    runApp(const ExpenseTrackerApp());
  }, (error, stacktrace) {
    logger.e("runGuardedZone: Caught Error in root zone");
    FirebaseCrashlytics.instance.recordError(error, stacktrace);
  });
}
