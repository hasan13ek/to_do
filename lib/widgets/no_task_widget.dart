import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';

import '../utils/app_images/app_images.dart';

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.noTask, scale: 2),
          SizedBox(height: 70.h),
          Text("No Tasks",
              style: fontRubikW500(appcolor: const Color(0xff554E8F)))
        ],
      ),
    );
  }
}
