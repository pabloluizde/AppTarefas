import 'package:flutter/material.dart';

class Dificulty extends StatefulWidget {
  final int dificultyLevel;

  const Dificulty({
    Key? key,
    required this.dificultyLevel,
  }) : super(key: key);

  @override
  State<Dificulty> createState() => _DificultyState();
}

class _DificultyState extends State<Dificulty> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificultyLevel >= 1)
              ? Colors.purpleAccent
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificultyLevel >= 2)
              ? Colors.purpleAccent
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificultyLevel >= 3)
              ? Colors.purpleAccent
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificultyLevel >= 4)
              ? Colors.purpleAccent
              : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificultyLevel >= 5)
              ? Colors.purpleAccent
              : Colors.blue[100],
        ),
      ],
    );
  }
}
