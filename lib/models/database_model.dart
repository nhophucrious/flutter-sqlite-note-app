import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo_model.dart';

class DatabaseConnect {
  Database? _database;
  // create a getter and open a connection to database
  Future<Database> get database async {
    // database location in the device
    final dbPath = await getDatabasesPath();
    const dbName = 'todo.db';
    final path = join(dbPath, dbName);
    // open db connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  // create db table in our database file
  Future<void> _createDB(Database db, int version) async {
    // make sure the columns create match the fields in the todo class
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(255),
        creationDate VARCHAR(255),
        isChecked INTEGER
      )
      ''');
  }

  // inserting todo card
  Future<void> insertTodo(Todo todo) async {
    // get connection
    final db = await database;
    // insert todo card
    await db.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // deleting todo card
  Future<void> deleteTodo(Todo todo) async {
    // get connection
    final db = await database;
    // insert todo card
    await db.delete('todo', where: 'id == ?', whereArgs: [todo.id]);
    // where checks for todo id in the list,
    // while whereArgs prevents SQL injection if any
  }

  Future<void> deleteAllTodos(Todo todo) async {
    final db = await database;
    await db.delete('todo');
  }

  // getting todo data
  Future<List<Todo>> getTodo() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('todo', orderBy: 'id DESC');
    return List.generate(
        items.length,
        (i) => Todo(
              id: items[i]['id'],
              title: items[i]['title'],
              creationDate: DateTime.parse(items[i]['creationDate']),
              isChecked: items[i]['isChecked'] == 1 ? true : false,
            ));
  }
}
