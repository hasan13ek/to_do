import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/blocs/todo/todo_state.dart';
import 'package:to_do/data/models/todo_model.dart';
import 'package:to_do/data/repositories/todo_repository.dart';
import 'package:to_do/data/service/get_it/get_it.dart';

class TodoBloc extends Bloc<TodoEvent, ToDoState> {
  TodoBloc() : super(Initial()){
    on<AddTask>(addTask);
    on<UpdateTask>(updateTask);
    on<DeleteTask>(deleteTask);
    on<GetSingleTaskById>(getSingleTaskById);
    on<GetAllTasks>(getAllTasks);
  }

  /// add task
  addTask(AddTask event, Emitter<ToDoState> emit) async {
    emit(LoadInProgressAdd());
    await getIt.get<TodoRepository>().addUser(todoModel: event.todoModel);
    emit(LoadInSuccessAdd());
  }

  /// update task
  updateTask(UpdateTask event, Emitter<ToDoState> emit) async {
    emit(LoadInProgressUpdate());
    await getIt
        .get<TodoRepository>()
        .updateTaskById(todoModel: event.todoModel);
    emit(LoadInSuccessUpdated());
  }

  /// delete task
  deleteTask(DeleteTask event, Emitter<ToDoState> emit) async {
    emit(LoadInProgressDelete());
    await getIt.get<TodoRepository>().deleteTaskById(id: event.id);
    emit(LoadInSuccessDeleted());
  }

  /// get all tasks
  getAllTasks(GetAllTasks event, Emitter<ToDoState> emit) async {
    emit(LoadInProgress());
    List<TodoModel> tasks = await getIt.get<TodoRepository>().allTasks();
    if (tasks.isNotEmpty) {
      emit(
        LoadInSuccess(tasks: tasks),
      );
    } else {
      emit(LoadInFailure(errorText: 'xatolik yuz berdi'));
    }
  }

  /// get single task by id
  getSingleTaskById(GetSingleTaskById event, Emitter<ToDoState> emit) async {
    emit(LoadInProgressGetSingle());
    List<TodoModel> tasks = await getIt
        .get<TodoRepository>()
        .getSingleTaskByCategory(category: event.category);
    if(tasks.isNotEmpty){
      emit(LoadInSuccessGetSingle(tasks: tasks));
    }else{
      emit(LoadInFailureGetSingle(errorText: 'xali task yoq'));
    }
  }
}
