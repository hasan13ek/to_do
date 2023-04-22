import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/blocs/todo/todo_state.dart';
import 'package:to_do/data/models/todo_model.dart';
import 'package:to_do/screens/tab/widget/delete_update_widget.dart';
import 'package:to_do/utils/app_icons/app_icons.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';
import 'package:to_do/widgets/items_widget.dart';
import 'package:to_do/widgets/my_custom_app_bar.dart';
import 'package:to_do/widgets/no_task_widget.dart';
import 'package:to_do/widgets/update_task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, ToDoState>(
      builder: (context, state) {
        if (state is LoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadInFailure) {
          return const NoTaskWidget();
        } else if (state is LoadInSuccess) {
          return Scaffold(
            appBar: MyCustomAppBar(title: '', length: state.tasks.length,size: state.tasks.first.isN==0?40:100,),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [

                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.88,
                    child: GroupedListView<TodoModel, DateTime>(
                        elements: state.tasks,
                        useStickyGroupSeparators: false,
                        floatingHeader: false,
                        order: GroupedListOrder.DESC,
                        groupBy: (element) => DateTime(
                          DateTime.parse(element.dateTime).year,
                          DateTime.parse(element.dateTime).month,
                          DateTime.parse(element.dateTime).day,
                        ),
                        groupHeaderBuilder: (TodoModel todoModel) => Padding(
                          padding: EdgeInsets.only(
                            left: 16.r,
                            right: 6.r,
                          ),
                          child: SizedBox(
                              height: 40,
                              child: Row(children: [
                                Text(
                                  DateFormat.yMMMd().format(
                                    DateTime.parse(todoModel.dateTime),
                                  ),
                                  style: fontRubikW500(
                                    appcolor: const Color(0xff8B87B3),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                              ])),
                        ),
                        itemBuilder: (context, TodoModel item) {
                          return SwipeActionCell(
                              key: ObjectKey([item]),
                              deleteAnimationDuration: 844,
                              trailingActions: <SwipeAction>[
                                SwipeAction(
                                    icon: DeleteUpdateWidget(
                                        color: const Color(0xffFFCFCF),
                                        imgUrl: AppIcons.iconDelete),
                                    widthSpace: 60,
                                    title: "",
                                    onTap: (CompletionHandler handler) {
                                      BlocProvider.of<TodoBloc>(context)
                                          .add(DeleteTask(id: item.id!));
                                      context.read<TodoBloc>().add(GetAllTasks());
                                    },
                                    color: Colors.transparent,
                                    backgroundRadius: 50.r),
                                SwipeAction(
                                    widthSpace: 40,
                                    backgroundRadius: 50.r,
                                    icon: DeleteUpdateWidget(
                                        color: const Color(0xffC4CEF5),
                                        imgUrl: AppIcons.iconEdit),
                                    title: "",
                                    onTap: (CompletionHandler handler) async {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return UpdateTaskWidget(
                                            title: item.title,
                                            category: item.category,
                                            dateTime: DateTime.parse(item.dateTime),
                                            completed: item.completed,
                                            isN: item.isN,
                                            id: item.id!,
                                          );
                                        },
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(52.0)),
                                        backgroundColor: Colors.white,
                                      );
                                    },
                                    color: Colors.transparent),
                              ],
                              child: ItemsWidget(
                                item: item,
                                isCategory: false,
                              ));
                        }), // optional
                  ),
                ],
              ),

            ),
          );
        }
        return const Text("");
      },
      listener: (context, state) {},
    );
  }
}
