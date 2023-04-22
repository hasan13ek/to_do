import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/blocs/todo/todo_state.dart';
import 'package:to_do/data/models/fake_model.dart';
import 'package:to_do/data/models/todo_model.dart';
import 'package:to_do/data/service/notification_service/local_notification_service.dart';
import 'package:to_do/utils/app_colors/app_colors.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';
import 'package:to_do/utils/constants.dart';
import 'package:to_do/utils/date_formatter/date_format.dart';
import 'package:to_do/utils/flutter_toast.dart';
import 'package:to_do/widgets/global_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

TextEditingController titleController = TextEditingController();
DateTime dateTime = DateTime.now();
TimeOfDay timeOfDay = TimeOfDay.now();
String category = '';

class _AddTaskWidgetState extends State<AddTaskWidget> {
  @override
  Widget build(BuildContext context) {
    int n = -1;
    return StatefulBuilder(builder: (context, categoryChanges) {
      return BlocConsumer<TodoBloc, ToDoState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(bottom: 20.r),
            width: double.infinity,
            height: 590.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                ZoomTapAnimation(
                  child: Container(
                      width: 53.h,
                      height: 53.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: MyColors.gradient1)),
                      child: const Icon(Icons.cancel,
                          color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 16.h),
                Text("Add new task",
                    style:
                    fontRubikW500(appcolor: Colors.black)),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.all(24.r),
                  child: TextFormField(
                    controller: titleController,
                    style:
                    fontRubikW500(appcolor: Colors.black),
                    onChanged: (v) {},
                    keyboardType: TextInputType.text,
                    decoration: getInputDecoration(
                        label: "write task title"),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: FakeModel.categories.length,
                    itemBuilder: (context, int index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 24.w,
                          ),
                          if (n == index) Container(),
                          if (n != index)
                            Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                  color: FakeModel.colors[index],
                                  shape: BoxShape.circle),
                            ),
                          SizedBox(
                            width: 6.w,
                          ),
                          TextButton(
                              style: n == index
                                  ? ButtonStyle(
                                  backgroundColor:
                                  MaterialStatePropertyAll(
                                      FakeModel.colors[n]))
                                  : null,
                              onPressed: () {
                                n = index;
                                category = FakeModel.categories[index];
                                categoryChanges(() {});
                              },
                              child: Text(
                                FakeModel.categories[index],
                                style: fontRubikW400(
                                    appcolor: n == index
                                        ? Colors.white
                                        : const Color(
                                        0xff8e8e8e)),
                              )),
                          SizedBox(
                            width: 16.w,
                          )
                        ],
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: 20.r, right: 20.r),
                  child: Divider(
                    color: const Color(0xffCFCFCF),
                    thickness: 2.2.r,
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 260.r),
                  child: TextButton(
                      onPressed: () async {
                        dateTime = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2300),
                        ))!;
                        if (!mounted) return;
                        timeOfDay = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ))!;
                        dateTime = DateTime(
                          dateTime.year,
                          dateTime.month,
                          dateTime.day,
                          timeOfDay.hour,
                          timeOfDay.minute,
                        );
                      },
                      child: Text(
                        'choose date',
                        style: fontRubikW400(
                            appcolor: Colors.black),
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Row(
                      children: [
                        Text(
                          dateTime == null
                              ? ''
                              : TimeUtils.formatToWeekMonthDay(
                              dateTime),
                          style: fontRubikW500(
                              appcolor: Colors.black),
                        ),
                        Text(
                          ', ${TimeUtils.formatToHour(dateTime)}',
                          style: fontRubikW500(
                              appcolor: Colors.black),
                        )
                      ],
                    )),
                const Expanded(child: SizedBox()),
                ZoomTapAnimation(
                  child: GlobalButton(title: 'Add Task'),
                  onTap: () {
                    if (titleController.text.isEmpty) {
                      getMyToast(message: 'Please Enter Title');
                      return;
                    }
                    if (dateTime == null) {
                      getMyToast(message: 'Please Choose Date');
                      return;
                    }
                    if (category.isEmpty) {
                      getMyToast(
                          message: "Please Choose Category");
                      return;
                    }
                    BlocProvider.of<TodoBloc>(context)
                        .add(AddTask(
                      todoModel: TodoModel(
                        title: titleController.text,
                        category: category,
                        dateTime: dateTime.toString(),
                        completed: 0,
                        isN: 0
                      ),
                    ));
                  },
                )
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is LoadInSuccessAdd) {
            category = '';
            BlocProvider.of<TodoBloc>(context)
                .add(GetAllTasks());
            LocalNotificationService.localNotificationService
                .scheduleNotification(
              id: 1,
              delayedTime: dateTime.minute,
              title: titleController.text
            );
            dateTime = DateTime.now();
            titleController.clear();
            Navigator.pop(context);
          }
        },
      );
    });
  }
}
