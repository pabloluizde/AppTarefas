import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/task_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'apptarefas');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TasksDao.tableSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
