import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/blocs/category_changes/category_change_bloc.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/cubits/tab/tab_cubit.dart';
import 'package:to_do/route.dart';
import 'package:to_do/utils/constants.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context)=> CategoryChangeBloc()),
        BlocProvider(create: (context)=> TodoBloc()..add(GetAllTasks())),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  const MaterialApp(
          title: 'Todo By Hasan',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter.generateRoute,
          initialRoute: splashPage,
        ),
    );
  }
}
