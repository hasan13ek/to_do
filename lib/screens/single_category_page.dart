import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/blocs/todo/todo_state.dart';
import 'package:to_do/utils/app_images/app_images.dart';
import 'package:to_do/widgets/items_widget.dart';
import 'package:to_do/widgets/no_task_widget.dart';

class SingleCategoryScreen extends StatelessWidget {
  const SingleCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.appBar,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<TodoBloc, ToDoState>(
        builder: (context, state) {
          if (state is LoadInProgressGetSingle) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadInSuccessGetSingle) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  ...List.generate(
                    state.tasks.length,
                        (index) {
                      return ItemsWidget(
                        item: state.tasks[index],
                        isCategory: true,
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const NoTaskWidget();
        },
      ),
    ), onWillPop: (){
      BlocProvider.of<TodoBloc>(context).add(GetSingleTaskById(category: 'category'));
      return _on(context);
    });
  }

  Future<bool> _on(BuildContext context)async{
    bool exitApp = false;
    if(exitApp==false){
      Navigator.pop(context);
    }
    return exitApp;
  }
}
