import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://thumb.ac-illust.com/1a/1af1047d7c4840ff267a1bfedfa05bc4_t.jpeg";
    return Drawer(
        child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: const [
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
            accountName: Text(
              "Aryan Rohela",
              style: TextStyle(fontSize: 14),
            ),
            accountEmail: Text(
              "rohelaaryan5@gmail.com",
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: Padding(
              padding: EdgeInsets.only(left: 0, bottom: 18),
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
