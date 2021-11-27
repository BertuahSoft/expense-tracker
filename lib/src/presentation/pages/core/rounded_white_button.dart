import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedWhiteButton extends StatelessWidget {
  final Widget child;
  final double width;
  final Function onPressed;

  const RoundedWhiteButton({
    Key? key,
    required this.child,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.r),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width, 45.h)),
        backgroundColor: MaterialStateProperty.all(ColorLight.white),
        // elevation: MaterialStateProperty.all(6),
        // shadowColor: MaterialStateProperty.all(ColorLight.white),
      ),
      onPressed: () {
        onPressed();
      },
      child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
          ),
          child: child),
    );
  }
}
