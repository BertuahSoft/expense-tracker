import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
}
