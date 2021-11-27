import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:expense_tracker/src/presentation/pages/core/rounded_white_button.dart';
import 'package:expense_tracker/src/presentation/pages/core/theme_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ThemeBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LottieBuilder.asset("assets/lottie/leaf-blow.json",
                  width: 322.w, height: 310.h, fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Welcome Saver",
                      style: TextStyle(
                          color: ColorLight.onPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 28.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                        "Login first so we can keep your savings data safe in our cloud storage.",
                        style: TextStyle(
                            color: ColorLight.onPrimary, fontSize: 18.sp)),
                    SizedBox(height: 60.h),
                    RoundedWhiteButton(
                      width: 50.w,
                      onPressed: () {},
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  SvgPicture.asset("assets/images/google.svg")),
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
                      onPressed: () {},
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
    );
  }
}
