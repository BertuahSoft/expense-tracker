import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:expense_tracker/src/application/core/auth_status/cubit/auth_status_cubit.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
              onTap: () {
                context.read<AuthStatusCubit>().signedOut();
              },
              child: const Icon(Icons.logout_outlined),
            ),
          ),
        ],
      ),
      body: BlocConsumer<AuthStatusCubit, AuthStatusState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            authenticated: (_) {},
            unauthenticated: (_) {
              context.router.replaceAll([const SignInRoute()]);
            },
          );
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
