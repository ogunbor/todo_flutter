import 'package:flutter/material.dart';
import 'package:todo_flutter/addTodo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String text = '';

  void changeText({required String todoText}) {
    setState(() {
      text = todoText;
    });
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
                        child: AddTodo(changeText: changeText),
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
      body: Container(
        child: Text('$text'),
      ),
    );
  }
}
