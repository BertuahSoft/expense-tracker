import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/src/presentation/pages/auth/sign_in_page.dart';
import 'package:expense_tracker/src/presentation/pages/boarding/boarding_page.dart';
import 'package:expense_tracker/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:expense_tracker/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: BoardingPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: DashboardPage)
  ],
)
class AppRouter extends _$AppRouter {}
