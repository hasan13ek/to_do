import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/utils/app_colors/app_colors.dart';
import 'package:to_do/utils/app_icons/app_icons.dart';
import 'package:to_do/utils/app_images/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../blocs/todo/todo_bloc.dart';
import '../blocs/todo/todo_event.dart';
import '../data/models/todo_model.dart';
import '../utils/app_text_style/text_style.dart';
import '../utils/date_formatter/date_format.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({Key? key, required this.item, required this.isCategory})
      : super(key: key);
  TodoModel item;
  bool isCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.r, right: 18.r, bottom: 16.r),
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0xff121212).withOpacity(0.1), blurRadius: 4)
        ], color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
        child: Row(
          children: [
            Container(
              width: 4.w,
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  bottomLeft: Radius.circular(6.r),
                ),
                color: item.category == 'Personal'
                    ? MyColors.c_FFD506
                    : item.category == 'Work'
                        ? MyColors.c_1ED102
                        : item.category == 'Meting'
                            ? MyColors.c_D10263
                            : item.category == 'Shopping'
                                ? MyColors.c_F29130
                                : item.category == 'Study'
                                    ? MyColors.c_3044F2
                                    : item.category == 'Party'
                                        ? const Color(0xff9BFFF8)
                                        : Colors.white,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            if (isCategory == false)
              ZoomTapAnimation(
                child: item.completed == 0
                    ? SvgPicture.asset(AppIcons.iconCircular)
                    : SvgPicture.asset(AppIcons.iconSuccess),
                onTap: () {
                  BlocProvider.of<TodoBloc>(context).add(
                    UpdateTask(
                      todoModel: TodoModel(
                        id: item.id,
                        title: item.title,
                        category: item.category,
                        dateTime: item.dateTime,
                        completed: item.completed == 1 ? 0 : 1,
                        isN: item.isN,
                      ),
                    ),
                  );
                  BlocProvider.of<TodoBloc>(context).add(GetAllTasks());
                },
              ),
            SizedBox(width: 12.w),
            Text(TimeUtils.formatToHour(DateTime.parse(item.dateTime)),
                style: fontRubikW400(appcolor: const Color(0xffc6c6c8))),
            SizedBox(width: 12.w),
            Text(
              item.title,
              style: fontRubikW500(appcolor: MyColors.c_554E8F),
            ),
            const Expanded(child: SizedBox()),
            if (isCategory == false)
              ZoomTapAnimation(
                child: Image.asset(
                  AppImages.notifun,
                  color: item.isN == 0 ? Colors.grey : Colors.yellow,
                  scale: 1.6,
                ),
                onTap: () {
                  BlocProvider.of<TodoBloc>(context).add(
                    UpdateTask(
                      todoModel: TodoModel(
                        id: item.id,
                        title: item.title,
                        category: item.category,
                        dateTime: item.dateTime,
                        completed: item.completed,
                        isN: item.isN == 1 ? 0 : 1,
                      ),
                    ),
                  );
                  BlocProvider.of<TodoBloc>(context).add(GetAllTasks());
                },
              ),
            SizedBox(width: 14.h)
          ],
        ),
      ),
    );
  }
}
