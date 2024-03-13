import 'package:flutter/material.dart';
import 'package:orga_orbit/backend/auth.dart' as auth;
import 'package:orga_orbit/pages/handler.dart';

class LoginForm {
  String password="";
  String email="max.mustermann@gmx.de";
}

class Login extends StatefulWidget {
  Login({
    Key? key,
    required this.form,
  }) : super(key: key);

  LoginForm form;

  @override
  createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login"),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    height: 60,
                    child: TextField(
                      // controller: emailController,
                      decoration: InputDecoration(labelText: "email"),
                      onChanged: (s) => {widget.form.email = s },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    height: 60,
                    child: TextField(
                      obscureText: true,
                      // controller: passController,
                      decoration: InputDecoration(labelText: "password"),
                      onChanged: (s) => {widget.form.password = s },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () => {}, // loginUser(widget.email, widget.password),
                      child: Text("login")),
                  Container(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {}, //toSubpage(1),
                    child: Text("signup"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}