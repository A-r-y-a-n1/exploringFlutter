import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  bool _obscureText = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, myRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              height: 310,
              width: 320,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 2.0,
            ),
            const SizedBox(
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
                        prefixIcon: const Icon(Icons.person_2_outlined),
                        hintText: "Enter Username",
                        labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        fillColor: Colors.grey.shade800,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          child: GestureDetector(
                            onTap: _toggle,
                            child: Icon(_obscureText
                                ? Icons.visibility_rounded
                                : Icons.visibility_off),
                          ),
                        ),
                        hintText: "Enter Password",
                        labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password length should be atleast 6";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Material(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10.0),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 65 : 95,
                        height: 40,
                        child: Center(
                          child: changeButton
                              ? const Icon(Icons.done)
                              : const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 19)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
