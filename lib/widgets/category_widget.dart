import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_state.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';

class CategoryItemWidget extends StatelessWidget {
   CategoryItemWidget({Key? key,required this.imageUrl,required this.categoryName,required this.color}) : super(key: key);
  String imageUrl;
  String categoryName;
  Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc,ToDoState>(builder: (context,state){
      if(state is LoadInSuccessGetSingle){
        return Container(
          width: 160.w,
          height: 180.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff121212).withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(1, 2)
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 66.w,
                height: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(child: SvgPicture.asset(imageUrl),),
              ),
              Text(categoryName,style: fontRubikW500(appcolor: const Color(0xff686868)),),
              SizedBox(height: 24.h,),
              Text("${state.tasks.length} Tasks",style: fontRubikW400(appcolor: const Color(0xffa1a1a1)).copyWith(fontSize: 12.sp),),


            ],
          ),
        );
      }else if(state is LoadInProgressGetSingle){
        return const Center(child: CircularProgressIndicator(),);
      }
      return Container(
        width: 160.w,
        height: 180.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff121212).withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(1, 2)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 66.w,
              height: 66,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.5),
              ),
              child: Center(child: SvgPicture.asset(imageUrl),),
            ),
            Text(categoryName,style: fontRubikW500(appcolor: const Color(0xff686868)),),
            SizedBox(height: 24.h,),
            Text(" Tasks",style: fontRubikW400(appcolor: const Color(0xffa1a1a1)).copyWith(fontSize: 12.sp),),


          ],
        ),
      );
    });
      
  }
}
