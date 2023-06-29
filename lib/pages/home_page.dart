import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/theme_model.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) => Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isdark = false
                      : themeNotifier.isdark = true;
                },
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 1.0, 0),
                  child: Icon(themeNotifier.isDark
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_outlined),
                ))
          ],
          title: Text("Catalog App"),
          titleTextStyle: TextStyle(
              color: context.theme.hintColor,
              fontSize: 30,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: context.theme.hintColor),
        ),
        backgroundColor: context.cardColor,
        drawerScrimColor: Colors.white,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (BuildContext context, store, VxStatus? status) =>
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, myRoutes.cartRoute);
                  },
                  backgroundColor: MyTheme.buttonColor,
                  child: const Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                  )).badge(
                  color: context.theme.hintColor,
                  size: 20,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                    color: context.theme.cardColor,
                    fontWeight: FontWeight.bold,
                  )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      CatalogList().py16().expand()
                    else
                      CircularProgressIndicator(
                        color: context.theme.hintColor,
                      ).centered().expand(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
