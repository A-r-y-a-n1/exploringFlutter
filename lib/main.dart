import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:flutter_catalog/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: myRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        myRoutes.homeRoute: (context) => HomePage(),
        myRoutes.loginRoute: (context) => LoginPage(),
        myRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
