import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @lazySingleton
  FirebaseCrashlytics get firebaseCrashlytics => FirebaseCrashlytics.instance;

  @lazySingleton
  FirebaseAnalytics get firebaseAnalytics => FirebaseAnalytics();

  @lazySingleton
  FirebaseAnalyticsObserver get firebaseAnalyticsObserver =>
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics);
}
