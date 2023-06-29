import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/10/21/Pictures/_7e701072-1375-11eb-9315-b00ef9141a48.jpg";
    return Drawer(
        child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: [
        Padding(
          padding: EdgeInsets.all(3.0),
          child: DrawerHeader(
              // decoration: BoxDecoration(
              //     color: Colors.black,
              //     gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: [Colors.blue, Colors.orange, Colors.purple])),
              child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            arrowColor: Colors.white,
            margin: EdgeInsets.zero,
            accountName: const Text(
              "Aryan Rohela",
              style: TextStyle(fontSize: 14),
            ),
            accountEmail: const Text(
              "rohelaaryan5@gmail.com",
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(left: 0, bottom: 18),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(imageUrl),
                maxRadius: 1,
              ),
            ),
          )),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            "  Home",
            style: TextStyle(fontSize: 18),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person_3_rounded),
          title: Text(
            "  Profile",
            style: TextStyle(fontSize: 18),
          ),
        ),
        ListTile(
          leading: Icon(Icons.mail_outline_outlined),
          title: Text(
            "  Mail",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    ));
  }
}
