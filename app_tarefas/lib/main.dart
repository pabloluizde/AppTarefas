import 'package:app_tarefas/screens/form_screen.dart';
import 'package:app_tarefas/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const InitialScreen());
  }
}
