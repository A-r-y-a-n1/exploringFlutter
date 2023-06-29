import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/widgets/theme_model.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) => MaterialApp(
          themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
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
        ),
      ),
    );
  }
}
