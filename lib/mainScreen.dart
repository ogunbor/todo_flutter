import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                    return Container(
                      height: 250,
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
    );
  }
}
