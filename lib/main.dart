import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
          child: Container(
              child: Text(
        "hello , welcome to flutter",
        style: TextStyle(color: Colors.purple),
      ))),
    );
  }
}
