import 'package:flutter/material.dart';
import 'package:todo_flutter/addTodo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = ["Eat", "sleep", "wake"];

  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Text('Hello world'),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('To do'),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 200,
                          child: AddTodo(addTodo: addTodo),
                        ),
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  todoList.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Mark as done')),
                        );
                      });
                },
                title: Text(todoList[index]),
                leading: Icon(Icons.access_alarm),
              );
            }));
  }
}
