import 'package:flutter/material.dart';
import 'package:todo_lists/classes/todo.dart';
import 'package:todo_lists/widgets/todo-card.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: welcom(),
    );
  }
}

List allTasks = [
  Todo(title: "title 1", finished: false, onTap: (){}),
  Todo(title: "title 2", finished: true, onTap: (){}),
  Todo(title: "title 3", finished: false, onTap: (){}),
];

welcom() {
  return Scaffold(
    backgroundColor: Color(0xFFE1E0E3),
    appBar: AppBar(
      title: const Text('ToDo', style: TextStyle(fontSize: 24,color: Colors.white)),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 13, 1, 30),
    ),
    body: Center(
      child: FractionallySizedBox( 
        // To make the child take 90% of the width
        widthFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...allTasks.map( (todo) => TodoCard(
              title: todo.title,
              isCompleted: todo.finished,
              onTap: todo.onTap,
            ))
            ],
        )
      )
    ),
  );
}