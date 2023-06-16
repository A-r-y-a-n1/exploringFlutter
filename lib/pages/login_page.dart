import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            height: 310,
            width: 310,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 2.0,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.grey.shade800,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hintText: "Enter Username",
                      labelText: "Username"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      fillColor: Colors.grey.shade800,
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Enter Password",
                      labelText: "Password"),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      minimumSize: Size(50, 60)),
                  child: Text("Login",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, myRoutes.homeRoute);
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
