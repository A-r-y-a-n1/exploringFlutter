import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App"),
      ),
      body: Center(
          child: Container(
              child: Text(
        "hello , welcome to flutter",
        style: TextStyle(color: Colors.purple, fontSize: 18),
      ))),
      drawer: Drawer(),
    );
  }
}
