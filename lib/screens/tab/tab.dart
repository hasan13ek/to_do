import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/cubits/tab/tab_cubit.dart';
import 'package:to_do/data/models/fake_model.dart';
import 'package:to_do/screens/tab/all_task_page.dart';
import 'package:to_do/screens/tab/home_page.dart';
import 'package:to_do/screens/tab/widget/add_task_widget.dart';
import 'package:to_do/utils/app_colors/app_colors.dart';
import 'package:to_do/utils/app_icons/app_icons.dart';
import 'package:to_do/utils/app_images/app_images.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';


class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];


  @override
  void initState() {
    screens.add(HomeScreen());
    screens.add(AllCategoryScreen());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        var index = context.watch<BottomNavCubit>().activePageIndex;
        return Scaffold(
          appBar: index==1?AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text('Today you have tasks',
                style: fontRubikW400(appcolor: Colors.white)),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.appBar), fit: BoxFit.fill)),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ):null,
          body: screens[index],
          bottomNavigationBar: Theme(
            data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ), child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: index,
            selectedItemColor: const Color(0xff5f87e7),
            unselectedItemColor: const Color(0xffdadada),
            elevation: 0,
            onTap: (value) {
              BlocProvider.of<BottomNavCubit>(context).changePageIndex(value);
              if(value==1){

              } if(value==0){
                BlocProvider.of<TodoBloc>(context).add(GetAllTasks());
              }

            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.iconHome, color: index == 0 ? MyColors.c_5F87E7 : MyColors.c_DADADA),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.iconTask,
                    color: index == 1 ? MyColors.c_5F87E7 : MyColors.c_DADADA,
                  ),
                  label: "Tasks",
              ),
            ],
          ),),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AddTaskWidget();
                  },
                  isScrollControlled: true,
                  enableDrag: true,
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52.0)),
                  backgroundColor: Colors.white,
                );
              },
              backgroundColor: const Color(0xffE0139C).withOpacity(0.7),
              child: const Icon(Icons.add, size: 40)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
