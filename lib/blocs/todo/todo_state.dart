import 'package:to_do/data/models/todo_model.dart';

abstract class ToDoState {}

class Initial extends ToDoState {}

/// get states
class LoadInProgress extends ToDoState {}

class LoadInFailure extends ToDoState {
 String errorText;
 LoadInFailure({required this.errorText});
}

class LoadInSuccess extends ToDoState {
  List<TodoModel> tasks;
  LoadInSuccess({required this.tasks});
}

/// update states
class LoadInProgressUpdate extends ToDoState {}

class LoadInFailureUpdate extends ToDoState {
  String errorText;
  LoadInFailureUpdate({required this.errorText});
}

class LoadInSuccessUpdated extends ToDoState {}

/// delete states

class LoadInProgressDelete extends ToDoState {}

class LoadInFailureDelete extends ToDoState {
 String errorText;
 LoadInFailureDelete({required this.errorText});
}

class LoadInSuccessDeleted extends ToDoState {}

/// add states

class LoadInProgressAdd extends ToDoState {}

class LoadInFailureAdd extends ToDoState {
 String errorText;
 LoadInFailureAdd({required this.errorText});
}

class LoadInSuccessAdd extends ToDoState {}

/// get single task by id states

class LoadInProgressGetSingle extends ToDoState {}

class LoadInFailureGetSingle extends ToDoState {
 String errorText;
 LoadInFailureGetSingle({required this.errorText});
}

class LoadInSuccessGetSingle extends ToDoState {
 List<TodoModel> tasks;
 LoadInSuccessGetSingle({required this.tasks});
}