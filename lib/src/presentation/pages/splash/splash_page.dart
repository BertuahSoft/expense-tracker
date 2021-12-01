import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/src/application/core/auth_status/cubit/auth_status_cubit.dart';

import 'package:expense_tracker/src/core/utils/logger.dart';
import 'package:expense_tracker/src/presentation/pages/core/theme_background.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  void _navigateToBoarding() async {
    await Future.delayed(const Duration(seconds: 3), () {
      logger.i("delayed to boarding for 3 seconds");
    });
    AutoRouter.of(context).replace(const BoardingRoute());
  }

  void _navigateToDashboard() async {
    await Future.delayed(const Duration(seconds: 3), () {
      logger.i("delayed to dashboard for 3 seconds");
    });
    //TODO: add dashboard page
    // AutoRouter.of(context).replace(const BoardingRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthStatusCubit, AuthStatusState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (state) {
              _navigateToDashboard();
            },
            unauthenticated: (_) {
              _navigateToBoarding();
            });
      },
      builder: (context, state) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: ThemeBackground(
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
