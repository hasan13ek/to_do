import 'package:to_do/data/models/todo_model.dart';

abstract class TodoEvent {}

class AddTask extends TodoEvent {
  TodoModel todoModel;
  AddTask({required this.todoModel});
}

class UpdateTask extends TodoEvent {
  TodoModel todoModel;
  UpdateTask({required this.todoModel});
}

class DeleteTask extends TodoEvent {
  int id;
  DeleteTask({required this.id});
}

class GetAllTasks extends TodoEvent {}

class GetSingleTaskById extends TodoEvent {
  String category;
  GetSingleTaskById({required this.category});
}
