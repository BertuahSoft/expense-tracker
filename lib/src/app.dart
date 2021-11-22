import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/core/localization/app_translation.dart';
import 'package:expense_tracker/src/core/utils/global_bloc.dart';
import 'package:expense_tracker/src/core/utils/helper.dart';
import 'package:expense_tracker/src/presentation/routes/app_route.dart';
import 'package:expense_tracker/src/presentation/routes/navigation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({Key? key}) : super(key: key);

  @override
  _ExpenseTrackerAppState createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  late String initialRoute;
  static FirebaseAnalytics analytics = getIt<FirebaseAnalytics>();
  static FirebaseAnalyticsObserver observer =
      getIt<FirebaseAnalyticsObserver>();
  static FirebaseCrashlytics crashlytics = getIt<FirebaseCrashlytics>();

  void _initializeFlutterFire() async {
    await crashlytics.setCrashlyticsCollectionEnabled(isProduction);
    Function originalOnError = FlutterError.onError as Function;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await crashlytics.recordFlutterError(errorDetails);
      // Forward to original handler.
      originalOnError(errorDetails);
    };
  }

  @override
  void initState() {
    super.initState();
    _initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    initialRoute = AppRoute.initialRoute;
    return MultiBlocProvider(
        providers: globalBloc,
        child: MultiBlocListener(
            listeners: [],
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              builder: () => GetMaterialApp(
                  title: "Expense Tracker",
                  debugShowCheckedModeBanner: false,
                  initialRoute: initialRoute,
                  getPages: Navigation.routes,
                  locale: Locale('en', 'US'),
                  navigatorObservers: <NavigatorObserver>[observer],
                  translations: AppTranslation(),
                  theme: ThemeData.light()),
            )));
  }
}
