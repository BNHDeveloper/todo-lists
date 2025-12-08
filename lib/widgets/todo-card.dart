import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback onTap;

  const TodoCard({
    Key? key,
    required this.title,
    required this.isCompleted,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16) ,
              decoration: BoxDecoration(
                color: Color(0xF6F6F6FF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9E9E9E),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ] ,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 66, 70, 74))),
                  !isCompleted ? Icon(Icons.close, color: Color.fromARGB(255, 248, 30, 5), size: 22):Icon(Icons.check, color: Color.fromARGB(255, 3, 168, 66), size: 22),
                ],
              ),
              ),);
  }
}