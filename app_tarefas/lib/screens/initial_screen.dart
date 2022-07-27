import 'package:app_tarefas/data/task_inherited.dart';
import 'package:app_tarefas/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "Tarefas",
                  style: TextStyle(color: Colors.black),
                )),
            Container(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(
                  icon: Icon(
                      opacidade
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color:
                          opacidade ? Colors.purpleAccent : Colors.purple[100]),
                  onPressed: () {
                    setState(() {
                      opacidade = !opacidade;
                    });
                  },
                )),
          ],
        ),
      ),
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: opacidade ? 1 : 0,
        child: ListView(
          children: TaskInherited.of(context).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskBuild: context,
                      )));
        },
      ),
    );
  }
}
