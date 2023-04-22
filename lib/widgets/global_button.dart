import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/utils/app_colors/app_colors.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';

class GlobalButton extends StatelessWidget {
   GlobalButton({Key? key,required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: 323.w,
      height: 53.h,
      decoration:  BoxDecoration(
        gradient: const LinearGradient(colors: MyColors.gradient3),
        borderRadius: BorderRadius.circular(6.r)
      ),
      child: Center(child:Text(title,style: fontRubikW500(appcolor: Colors.white),),)

    );
  }
}
