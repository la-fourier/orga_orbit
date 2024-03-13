import 'package:flutter/material.dart';
import 'package:orga_orbit/backend/auth.dart' as auth;
import 'package:orga_orbit/pages/handler.dart';

class SignupForm {
  String password="";
  String email="max.mustermann@gmx.de";
}

class Signup extends StatefulWidget {
  Signup({
    Key? key,
    required this.form,
  }) : super(key: key);

  SignupForm form;

  @override
  createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Text("Mail: "),
            // Textfield
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => {},
              child: Text("Submit"),
            ),
            TextButton(
              onPressed: () => {},
              child: Text("Cancel"),
            ),
          ],
        ),
      ]),
    );
  }
}