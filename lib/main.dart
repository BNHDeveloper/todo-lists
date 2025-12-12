import 'package:flutter/material.dart';
import 'package:todo_lists/classes/todo.dart';
import 'package:todo_lists/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}
// 1 36 50
List allTasks = [
  Todo(title: "title 1", finished: false, onTap: () {}),
  Todo(title: "title 2", finished: true, onTap: () {}),
  Todo(title: "title 3", finished: false, onTap: () {}),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const HomeScreen(), // proper widget
    );
  }
}

//  HomeScreen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(38, 37, 37, 1),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: bool.fromEnvironment( 'scrollControlled', defaultValue: true),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          maxLength: 100,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Title',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Logic to add the new task
                          Navigator.pop(context);
                        },
                        child: Text('Add Task'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Color(0xFFE1E0E3),
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 13, 1, 30),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...allTasks.map(
                (todo) => TodoCard(
                  title: todo.title,
                  isCompleted: todo.finished,
                  onTap: todo.onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}