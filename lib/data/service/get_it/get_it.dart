import 'package:get_it/get_it.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/data/local_db/local_db.dart';
import 'package:to_do/data/repositories/todo_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => LocalDatabase());
  getIt.registerLazySingleton(() => TodoRepository());
  getIt.registerLazySingleton(() => TodoBloc());
}
