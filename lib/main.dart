import 'package:flutter/material.dart';
import 'package:todo_lists/classes/todo.dart';
import 'package:todo_lists/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

// 2 15 01 PM
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
      home: HomeScreen(), // proper widget
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//  HomeScreen widget
class _HomeScreenState extends State<HomeScreen>  {
  // const HomeScreen({Key? key}) : super(key: key);
  final myController = TextEditingController();
  String todoTask = "";
  addTask() {
    setState(() {
      allTasks.add(
        Todo(
          title: myController.text,
          finished: false,
          onTap: () {},
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(38, 37, 37, 1),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showDialog(
            // isScrollControlled: bool.fromEnvironment(
            //   'scrollControlled',
            //   defaultValue: true,
            // ),
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 250,
                  // color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          maxLength: 100,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Title',
                          ),
                          controller: myController,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addTask();
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
      backgroundColor: Color(0xFFEDECF0),
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
            children: [
              SizedBox(height: 40),
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
