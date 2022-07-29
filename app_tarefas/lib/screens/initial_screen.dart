import 'package:app_tarefas/screens/form_screen.dart';
import 'package:flutter/material.dart';

import '../components/difficulty.dart';
import '../data/dao/task_dao.dart';
import '../models/task_model.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

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
          opacity: opacidade ? 1 : 0,
          child: FutureBuilder<List<TaskViewModel>>(
            future: _dao.findAll(),
            initialData: [],
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  final List<TaskViewModel>? contacts = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final TaskViewModel contact = contacts![index];
                      return TasksList(contact.nome, contact.foto,
                          contact.dificuldade, contact.desc);
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
                  // TODO: Handle this case.
                  break;
                case ConnectionState.active:
                  // TODO: Handle this case.
                  break;
              }
              return Text("data");
            },
          )),
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

class TasksList extends StatefulWidget {
  final String nome;
  final String foto;
  final String desc;
  final int dificuldade;

  const TasksList(this.nome, this.foto, this.dificuldade, this.desc, {Key? key})
      : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  int nivel = 0;
  double padValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            padValue = padValue == 0.0 ? 20.0 : 0.0;
          });
        },
        child: Container(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.all(1.0),
                height: padValue == 0.0 ? 143 : 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 216, 216, 216),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Container(
                  child: padValue == 20.0
                      ? Container(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: Container(
                                  height: 110,
                                  alignment: Alignment.topLeft,
                                  child: ListView(
                                    children: [
                                      Text(
                                        widget.desc,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      : null,
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: nivel > 0
                                ? (widget.dificuldade > 0)
                                    ? (nivel / widget.dificuldade) / 10
                                    : 0.1
                                : 0.1,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.foto,
                            )),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  widget.nome,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Dificulty(
                                dificultyLevel: widget.dificuldade,
                              )
                            ],
                          ),
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent,
                                blurRadius: 7.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                              ),
                            ], borderRadius: BorderRadius.circular(5.0)),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purpleAccent,
                                ),
                                onPressed: () {
                                  setState(() {
                                    nivel++;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Icon(Icons.arrow_drop_up),
                                    Text(
                                      "UP",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 200,
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.purple[100],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.purpleAccent),
                                  value: (widget.dificuldade > 0)
                                      ? (nivel / widget.dificuldade) / 10
                                      : 1,
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Nivel: $nivel",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
