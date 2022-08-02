import 'package:app_tarefas/screens/initial_screen.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => InitialScreen())));
    imageCache.clear();
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Container(
          alignment: Alignment.center,
          child: const AvatarGlow(
            endRadius: 120.0,
            child: Icon(
              size: 100,
              Icons.visibility,
              color: Colors.white,
            ),
          )),
    );
  }
}
