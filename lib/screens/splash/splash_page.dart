import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/utils/app_colors/app_colors.dart';
import 'package:to_do/utils/app_images/app_images.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';
import 'package:to_do/utils/constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 200.r, bottom: 40.r),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
            width: 180.w,
            height: 196.h,
          ),
          SizedBox(
            height: 112.h,
          ),
          Text(
            'Reminders made simple',
            style: fontRubikW500(appcolor: MyColors.c_554E8F),
          ),
          const Expanded(child: SizedBox()),
          ZoomTapAnimation(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, tabBox, (route) => false);
            },
            child: Container(
              width: 258.w,
              height: 56.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff121212).withOpacity(0.3),
                      blurRadius: 8)
                ],
                borderRadius: BorderRadius.circular(12.r),
                gradient: const LinearGradient(colors: MyColors.gradient2),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: fontRubikW400(appcolor: const Color(0xfffcfcfc)),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
