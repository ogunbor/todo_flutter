import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  TodoListBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  // This function gets triggered when list item is clicked
  void onItemClicked({required int index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                  Navigator.pop(context);
                },
                child: Text('Mark as done')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(
            child: Text('No items to display'),
          )
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                // secondaryBackground: Container(
                //   color: Colors.red,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Icon(Icons.delete),
                //       ),
                //     ],
                //   ),
                // ),
                background: Container(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                  // if (direction == DismissDirection.startToEnd) {
                  //   print('Mark as spam');
                  // } else {
                  //   print('Delete');
                  // }
                },
                child: ListTile(
                  onTap: () {
                    onItemClicked(index: index);
                  },
                  title: Text(widget.todoList[index]),
                  leading: Icon(Icons.access_alarm),
                ),
              );
            });
  }
}
