import 'package:app_tarefas/task_widgets.dart';
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
        title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text("Tarefas")),
      ),
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: opacidade ? 1 : 0,
        child: ListView(
          children: [
            Task(
                "Aprender Flutter",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                3),
            Task(
                "Fazer Exercicios",
                "https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg",
                2),
            Task(
                "Descanso",
                "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                4),
            Task(
                "Descanso",
                "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                4),
            Task(
                "Descanso",
                "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                4),
            Task(
                "Descanso",
                "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
      ),
    );
  }
}
