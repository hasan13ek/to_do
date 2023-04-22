import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do/data/models/todo_model.dart';
import 'package:to_do/utils/flutter_toast.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("tasks.db");
      return _database!;
    }
  }
  ///------------------------------------------------




  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, ver) async {
      await db.execute("""
  CREATE TABLE  $table (
    ${CachedTaskFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CachedTaskFields.title} TEXT,
    ${CachedTaskFields.category} TEXT,
    ${CachedTaskFields.createdAt} TEXT,
    ${CachedTaskFields.completed} BOOLEAN,
    ${CachedTaskFields.isN} INTEGER
     )
  """);
    });
  }
  ///----------------------------------------------------

  LocalDatabase._init();

  ///-------------------------------------------Cached Tasks Table------------------------------------

  static Future<TodoModel> insertCachedTask(TodoModel todoModel) async {
    final db = await getInstance.database;
    final id = await db.insert(table, todoModel.toJson());
    if(id>0){
      getMyToast(message: "Qo'shildi");
    }
    return todoModel.copyWith(id: id);
  }

  static Future<List<TodoModel>> getSingleTaskById(String category) async {
    final db = await getInstance.database;
    final results = await db.query(
      table,
      columns: CachedTaskFields.values,
      where: '${CachedTaskFields.category} = ?',
      whereArgs: [category],
    );
    if (results.isNotEmpty) {
      return  results.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('$category not found');
    }
  }

  static Future<List<TodoModel>> getAllCachedTasks() async {
    final db = await getInstance.database;
    const orderBy = "${CachedTaskFields.createdAt} ASC";
    final result = await db.query(
      table,
      orderBy: orderBy,
    );
    var data = result.map((json) => TodoModel.fromJson(json)).toList();
    return data;
  }

  static Future<int> deleteCachedTaskById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(table, where: "${CachedTaskFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  static Future<TodoModel> updateCachedTask(TodoModel todoModel) async {
    Map<String, dynamic> col = {

      ///Bu yerda update bo'ladigan narsa yoziladi
      CachedTaskFields.title: todoModel.title,
      CachedTaskFields.createdAt: todoModel.dateTime,
      CachedTaskFields.category: todoModel.category,
      CachedTaskFields.completed: todoModel.completed,
      CachedTaskFields.isN: todoModel.isN,
    };

    final db = await getInstance.database;
    int id =  await db.update(
      table,
      col,
      where: '${CachedTaskFields.id} = ?',
      whereArgs: [todoModel.id],
    );

    return todoModel.copyWith(id: id);
  }
  static Future<List<TodoModel>> getTaskByCategory({String category = ''}) async {
    var database = await getInstance.database;

    if (category.isNotEmpty) {
      var listOfTodos = await database.query(
        table,
        where: 'category LIKE ?',
        whereArgs: ['%$category%'],
      );
      var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
      return list;
    } else {
      var listOfTodos = await database.query(table, columns: CachedTaskFields.values);
      var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
      return list;
    }
  }

  static Future close() async {
    final db = await getInstance.database;
    db.close();
  }
}