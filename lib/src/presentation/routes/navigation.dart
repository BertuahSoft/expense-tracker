import 'package:expense_tracker/src/presentation/pages/splash/splash_page.dart';
import 'package:expense_tracker/src/presentation/routes/app_route.dart';
import 'package:get/get.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(name: AppRoute.splash, page: () => SplashPage())
  ];
}
