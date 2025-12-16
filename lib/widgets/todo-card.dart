import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool finished;
  final Function changeStatus;
  final int index;
  final Function delete;
  

  const TodoCard({
    super.key,
    required this.title,
    required this.finished,
    required this.changeStatus,
    required this.index,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeStatus(index),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xF6F6F6FF),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9E9E9E),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),               
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 66, 70, 74),
                  decoration: finished? TextDecoration.lineThrough:TextDecoration.none
                ),
              ),
              Row(
                children: [
                    !finished
                  ? Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 5, 98, 248),
                      size: 22,
                    )
                  : Icon(
                      Icons.check,
                      color: Color.fromARGB(255, 3, 168, 66),
                      size: 22,
                    ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => delete(index),
                child: Icon(
                  Icons.delete_rounded,
                  color: Color.fromARGB(255, 218, 15, 15),
                  size: 22,
                ),
              ),
                ],
              )
            ],
          ),
        ),
    );
  }
}
