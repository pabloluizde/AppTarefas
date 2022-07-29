import 'package:app_tarefas/components/difficulty.dart';
import 'package:app_tarefas/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final String desc;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, this.desc, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
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
