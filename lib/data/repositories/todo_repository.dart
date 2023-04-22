import 'package:to_do/data/local_db/local_db.dart';
import 'package:to_do/data/models/todo_model.dart';

class TodoRepository {

  Future<TodoModel> addUser({required TodoModel todoModel}) async =>
      LocalDatabase.insertCachedTask(todoModel);

  Future<List<TodoModel>> allTasks() async => LocalDatabase.getAllCachedTasks();

  Future<int> deleteTaskById({required int id}) async =>
      LocalDatabase.deleteCachedTaskById(id);

  Future<TodoModel> updateTaskById({required TodoModel todoModel}) async =>
      LocalDatabase.updateCachedTask(todoModel);

  Future<List<TodoModel>> getSingleTaskByCategory({required String category}) async =>
      LocalDatabase.getTaskByCategory(category: category);
}