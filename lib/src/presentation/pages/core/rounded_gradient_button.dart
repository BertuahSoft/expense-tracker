import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedGradientButton extends StatelessWidget {
  final String text;
  final double width;
  final Function onpressed;

  const RoundedGradientButton({
    Key? key,
    required this.text,
    required this.width,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0, 0.7, 1.0],
          colors: [
            ColorLight.primaryVariant,
            ColorLight.secondary,
            ColorLight.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(80.r),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.r),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(width, 45.h)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          onpressed();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
