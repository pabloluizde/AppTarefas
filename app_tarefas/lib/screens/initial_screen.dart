import 'package:app_tarefas/components/task_wifgets.dart';
import 'package:app_tarefas/screens/form_screen.dart';
import 'package:flutter/material.dart';
import '../data/dao/task_dao.dart';
import '../models/task_model.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  final TasksDao _dao = TasksDao();
  List<TaskViewModel> contacts = [];

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
        opacity: opacidade ? 1 : 0.0,
        child: FutureBuilder<List<TaskViewModel>>(
          future: _dao.findAll(),
          initialData: contacts,
          builder: (context, AsyncSnapshot<List<TaskViewModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final List<TaskViewModel>? contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final TaskViewModel contact = contacts![index];

                    return TasksList(contact.nome, contact.foto,
                        contact.dificuldade, contact.desc, contact.id);
                  },
                  itemCount: contacts?.length,
                );

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('Loading')
                    ],
                  ),
                );
              case ConnectionState.none:
                break;
              case ConnectionState.active:
                break;
            }
            return Text("data");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
      ),
    );
  }
}
