import 'package:flutter/material.dart';
import 'package:orga_orbit/backend/auth.dart';
import 'package:orga_orbit/styles.dart';
import 'handler.dart';

class LoginFormData {
  String mail = "";
  String password = "";

  Widget login(PageHandler handler) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    height: 60,
                    child: TextField(
                      style: TextStyle(
                        color: accentColor,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      decoration: InputDecoration(labelText: "email"),
                      onSubmitted: (s) => {mail = s, handler.notifyListeners()},
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
                      decoration: InputDecoration(labelText: "password"),
                      onSubmitted: (s) =>
                          {password = s, handler.notifyListeners()},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () => {
                            handler.setUser(signIn(mail, password)),
                            print(mail),
                            print(password)
                          },
                      child: Text("login")),
                  Container(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => handler.toSubpage(1),
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

class SignupFormData {
  String mail = "yourmail@server.com";
  String firstName = "";
  String lastName = "";

  Widget signup(PageHandler handler) {
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
              onPressed: () => handler,
              child: Text("Submit"),
            ),
            TextButton(
              onPressed: () => handler,
              child: Text("Cancel"),
            ),
          ],
        ),
      ]),
    );
  }
}
