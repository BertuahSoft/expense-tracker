import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:expense_tracker/src/core/utils/helper.dart';
import 'package:expense_tracker/src/presentation/pages/core/rounded_gradient_button.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 15.h,
      width: 15.w,
      decoration: BoxDecoration(
          color: isActive ? ColorLight.primaryVariant : ColorLight.grey,
          borderRadius: BorderRadius.all(Radius.circular(15.r))),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLight.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Padding(
              padding: EdgeInsets.only(top: 125.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                      height: 500.h,
                      child: PageView(
                          physics: const ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            OnboardingPage(
                              assets: "assets/images/money_management.png",
                              title: i10n.moneyManagement,
                              description: i10n.moneyManagementDesc,
                            ),
                            OnboardingPage(
                              assets: "assets/images/budget_planning.png",
                              title: i10n.budgetPlanning,
                              description: i10n.budgetPlanningDesc,
                            ),
                            OnboardingPage(
                              assets: "assets/images/happy_saving.png",
                              title: i10n.happySaving,
                              description: i10n.happySavingDesc,
                            ),
                          ])),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 35.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _currentPage != _numPages - 1
                          ? _buildPageIndicator()
                          : [
                              Expanded(
                                  child: RoundedGradientButton(
                                      text: i10n.startSaving.toUpperCase(),
                                      width: 50.w,
                                      onpressed: () {
                                        context.router
                                            .replace(const SignInRoute());
                                      }))
                            ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String assets;
  final String title;
  final String description;
  const OnboardingPage({
    required this.assets,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(assets, width: 250.w, height: 167.h),
        SizedBox(
          height: 50.h,
        ),
        Text(title,
            style: TextStyle(
                color: ColorLight.onPrimary,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 50.h),
        Text(description,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp))
      ],
    );
  }
}
