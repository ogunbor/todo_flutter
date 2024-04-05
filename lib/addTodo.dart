import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

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
            labelText: 'Username',
            icon: Icon(Icons.pin),
          ),
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              print(todoText.text);
            },
            child: Text('Add task'))
      ],
    );
  }
}
