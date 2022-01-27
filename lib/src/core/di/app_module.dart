import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class AppModule {
  @lazySingleton
  Logger provideLogger() => Logger(
      printer: PrettyPrinter(colors: true, printEmojis: true, printTime: true));

  @lazySingleton
  FlutterLocalNotificationsPlugin provideLocalNotification() =>
      FlutterLocalNotificationsPlugin();

  @lazySingleton
  S provideS() => S();

  @lazySingleton
  FlutterSecureStorage get session => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: IOSAccessibility.first_unlock));

  @lazySingleton
  AppRouter get appRouter => AppRouter();
}
