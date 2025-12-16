import 'package:flutter/material.dart';
import 'package:todo_lists/classes/todo.dart';
import 'package:todo_lists/widgets/todo-card.dart';
import 'package:todo_lists/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

// [3,38,33]
List allTasks = [
  Todo(title: "title 1", finished: false),
  Todo(title: "title 2", finished: true),
  Todo(title: "title 0", finished: true),
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
class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);
  final myController = TextEditingController();
  String todoTask = "";
  addTask() {
    setState(() {
      allTasks.add(Todo(title: myController.text, finished: false));
    });
  }
  chngeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].finished = !allTasks[taskIndex].finished;
    });
  }
  deletTask(int taskIndex) {
    setState(() {
      allTasks.removeAt(taskIndex);
    });
  }
  deleteAll(){
    setState(() {
      allTasks.removeRange(0,allTasks.length);
    });
  }
  @override
  Widget build(BuildContext context) {
    int calculateTask() {
      int tasks = 0;
      allTasks.forEach((ele) {
        if (ele.finished) {
          tasks++;
        }
      });
      return tasks;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(38, 37, 37, 1),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: bool.fromEnvironment(
              'scrollControlled',
              defaultValue: true,
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 300,
                color: Colors.white,
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
              );
            },
          );
        },
      ),
      backgroundColor: Color(0xFFE1E0E3),
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        // centerTitle: true,
        backgroundColor: Color.fromARGB(255, 13, 1, 30),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 37,
            color: Color.fromARGB(255, 217, 217, 217),
          )
        ],
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            children: [
              Counter(tasks: allTasks.length, complited: calculateTask()),
              SizedBox(
                height: 550,
                child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                      title: allTasks[index].title,
                      finished: allTasks[index].finished,
                      changeStatus: chngeStatus,
                      index: index,
                      delete:deletTask,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
