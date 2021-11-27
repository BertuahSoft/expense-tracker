import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:expense_tracker/src/core/utils/helper.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({Key? key}) : super(key: key);

  @override
  _ExpenseTrackerAppState createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  final _appRouter = AppRouter();
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
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp.router(
              title: i10n.appName,
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(
                navigatorObservers: () => <NavigatorObserver>[observer],
              ),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: lightTheme(),
              darkTheme: ThemeData.dark(),
            ));
  }
}
