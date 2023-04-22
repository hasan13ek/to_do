import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteUpdateWidget extends StatelessWidget {
   DeleteUpdateWidget({Key? key,required this.color,required this.imgUrl}) : super(key: key);

  String imgUrl;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.h,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
      child: Center(
        child: SvgPicture.asset(imgUrl),
      ),
    );
  }
}
