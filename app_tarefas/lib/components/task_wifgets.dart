import 'dart:io';

import 'package:app_tarefas/components/difficulty.dart';
import 'package:app_tarefas/components/task_field_desc.dart';
import 'package:flutter/material.dart';
import '../data/dao/task_dao.dart';

class TasksList extends StatefulWidget {
  final String nome;
  final String foto;
  final String desc;
  final int dificuldade;
  final int id;

  TasksList(this.nome, this.foto, this.dificuldade, this.desc, this.id,
      {Key? key})
      : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  int nivel = 0;
  double padValue = 0.0;
  final TasksDao _dao = TasksDao();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onLongPress: () {
          setState(() {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Concluiu??"),
                content: const Text("Já está concluido?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                        _dao.delete(widget.id);
                      });
                    },
                    child: Container(
                      color: Colors.purpleAccent,
                      padding: const EdgeInsets.all(14),
                      child: const Text("Conclui"),
                    ),
                  ),
                ],
              ),
            );
          });
        },
        onTap: () {
          setState(() {
            padValue = padValue == 0.0 ? 20.0 : 0.0;
          });
        },
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
                child: padValue == 20.0 ? FieldDesc(widget: widget) : null,
              ),
            ),
            Column(
              children: [
                // Container(
                //   child: Image.file(File(widget.foto)),
                // ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.4,
                          fit: BoxFit.cover,
                          image: FileImage(File(widget.foto))),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Dificulty(
                                dificultyLevel: widget.dificuldade,
                              ),
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
                            "Concluído: $nivel%",
                            style: const TextStyle(color: Colors.black),
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
    );
  }
}
