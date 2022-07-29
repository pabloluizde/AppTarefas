import 'package:app_tarefas/models/task_model.dart';
import 'package:sqflite/sqlite_api.dart';

import '../app_database.dart';

class TasksDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_foto TEXT, '
      '$_desc TEXT, '
      '$_dificuldade INTEGER)';
  static const String _tableName = 'tasks';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _dificuldade = 'dificuldade';
  static const String _foto = 'foto';
  static const String _desc = 'desc';

  Future<int> save(TaskViewModel task) async {
    final Database db = await getDatabase();
    Map<String, dynamic> taskMap = _toMap(task);
    return db.insert('tasks', taskMap);
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return await db.delete('tasks', where: '"$_id" = ?', whereArgs: [id]);
  }

  Future<int> update(TaskViewModel todo) async {
    final Database db = await getDatabase();
    return await db
        .update('tasks', _toMap(todo), where: '$_id = ?', whereArgs: [todo.id]);
  }

  Map<String, dynamic> _toMap(TaskViewModel task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_nome] = task.nome;
    taskMap[_dificuldade] = task.dificuldade;
    taskMap[_foto] = task.foto;
    taskMap[_desc] = task.desc;
    return taskMap;
  }

  Future<List<TaskViewModel>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<TaskViewModel> task = _toList(result);
    return task;
  }

  List<TaskViewModel> _toList(List<Map<String, dynamic>> result) {
    final tasks = <TaskViewModel>[];
    for (Map<String, dynamic> row in result) {
      final task = TaskViewModel(
        row[_id],
        row[_nome],
        row[_dificuldade],
        row[_foto],
        row[_desc],
      );
      tasks.add(task);
    }
    return tasks;
  }
}
