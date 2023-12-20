import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/data/data.dart';

class TaskDatasource {
  static final TaskDatasource _instace = TaskDatasource._();
  factory TaskDatasource() => _instace;

  TaskDatasource._() {
    _initialDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initialDB();
    return _database!;
  }

  Future<Database> _initialDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "TASK.DB");
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(''' 
        create table ${AppKeys.dbTable}(
          ${TaskKey.id} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${TaskKey.title} TEXT,
          ${TaskKey.note}TEXT,
          ${TaskKey.time}TEXT,
          ${TaskKey.date}TEXT,
          ${TaskKey.category}TEXT,
          ${TaskKey.isCompleted}INTEGER,
          )
      
       ''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(AppKeys.dbTable, task.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTable,
        task.toJson(),
        where: "id=?",
        whereArgs: [task.id],
      );
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        AppKeys.dbTable,
        where: "id=?",
        whereArgs: [task.id],
      );
    });
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db.query(AppKeys.dbTable, orderBy: "id DESC");
    return List.generate(data.length, (index) => Task.fromJson(data[index]));
  }
}
