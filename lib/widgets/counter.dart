import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int tasks;
  final int complited;

  const Counter({
    super.key,
    required this.tasks,
    required this.complited,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
              "$complited/$tasks",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
  }
}