import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter/addTodo.dart';
import 'package:todo_flutter/widgets/todoList.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Already exists",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //content: Text('This todo already exists'),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                )
              ],
            );
          });
      return;
    }

    setState(() {
      todoList.insert(0, todoText);
    });

    updateLocalData();

    onTap() {
      Navigator.pop(context);
    }
  }

  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an list of strings to 'items' key.
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList('todoList') ?? []).toList();
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void showAddTodoBottomSheet() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.blueGrey[900],
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showAddTodoBottomSheet();
          }),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[800],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "To do",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("https://google.com"));
              },
              leading: Icon(Icons.person),
              title: Text(
                "About me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("mailto:ssandbox@gmail.com"));
              },
              leading: Icon(Icons.email),
              title: Text(
                "Contact me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('To do'),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       showAddTodoBottomSheet();
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Icon(Icons.add),
        //     ),
        //   ),
        // ],
      ),
      body: TodoListBuilder(
        todoList: todoList,
        updateLocalData: updateLocalData,
      ),
    );
  }
}
