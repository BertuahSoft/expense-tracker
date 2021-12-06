import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/application/auth/cubit/authentication_cubit.dart';
import 'package:expense_tracker/src/application/core/auth_status/cubit/auth_status_cubit.dart';
import 'package:expense_tracker/src/application/core/flash/cubit/flash_cubit.dart';
import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:expense_tracker/src/core/utils/helper.dart';
import 'package:expense_tracker/src/core/utils/logger.dart';
import 'package:expense_tracker/src/presentation/pages/core/rounded_white_button.dart';
import 'package:expense_tracker/src/presentation/pages/core/theme_background.dart';
import 'package:expense_tracker/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (context) => getIt<AuthenticationCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<AuthStatusCubit, AuthStatusState>(
            listener: (context, state) {
              state.map(
                initial: (_) {},
                authenticated: (authenticated) {
                  logger.d(authenticated);
                  context.router.replace(const DashboardRoute());
                },
                unauthenticated: (unauthenticated) {
                  context
                      .read<FlashCubit>()
                      .showSnackbar(message: i10n.cannotAuthenticated);
                },
              );
            },
            child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                state.map(
                    initial: (_) {},
                    loading: (_) {},
                    success: (state) {
                      context.read<FlashCubit>().showSnackbar(
                          message:
                              i10n.welcomeUser(state.user.name.getOrCrash()));
                      context.read<AuthStatusCubit>().getAuthenticatedUser();
                    },
                    failure: (state) {
                      state.failure.map(
                          cancelledByUser: (failure) {},
                          serverError: (failure) {
                            context
                                .read<FlashCubit>()
                                .showSnackbar(message: i10n.cannotConnect);
                          });
                    });
              },
              builder: (context, state) => ThemeBackground(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LottieBuilder.asset("assets/lottie/leaf-blow.json",
                        width: 322.w,
                        height: 310.h,
                        fit: BoxFit.fill,
                        frameRate: FrameRate.max),
                    // LottieBuilder.asset("assets/lottie/footer.json",
                    //     width: 322.w, frameRate: FrameRate.max),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            i10n.welcomeSaver,
                            style: TextStyle(
                                color: ColorLight.onPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.sp),
                          ),
                          SizedBox(height: 10.h),
                          Text(i10n.loginFirst,
                              style: TextStyle(
                                  color: ColorLight.onPrimary,
                                  fontSize: 18.sp)),
                          SizedBox(height: 60.h),
                          RoundedWhiteButton(
                            width: 50.w,
                            onPressed: () {
                              context
                                  .read<AuthenticationCubit>()
                                  .signInWithGoogle();
                            },
                            child: Stack(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: SvgPicture.asset(
                                        "assets/images/google.svg")),
                                const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Google",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorLight.onPrimary,
                                          // fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          RoundedWhiteButton(
                            width: 50.w,
                            onPressed: () {
                              context
                                  .read<AuthenticationCubit>()
                                  .signInWithFacebook();
                            },
                            child: Stack(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: SvgPicture.asset(
                                        "assets/images/facebook.svg")),
                                const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Facebook",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorLight.onPrimary,
                                          // fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
