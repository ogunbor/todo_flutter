import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  void Function({required String todoText}) changeText;

  AddTodo({super.key, required this.changeText});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Add todo: '),
        TextField(
          controller: todoText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: 'Write your todo here ...',
            // labelText: 'Username',
            // icon: Icon(Icons.pin),
          ),
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              widget.changeText(todoText: todoText.text);
              todoText.text = "";
            },
            child: Text('Add task'))
      ],
    );
  }
}
