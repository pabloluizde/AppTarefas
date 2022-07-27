import 'package:app_tarefas/components/task_widgets.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task("Aprender Flutter",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 3)
  ];

  void newTask(String name, String photo, int dif) {
    taskList.add(Task(name, photo, dif));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
