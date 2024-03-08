import 'package:flutter/material.dart';
import 'package:orga_orbit/pages/forms.dart';
import 'package:orga_orbit/styles.dart';
import 'package:orga_orbit/backend/auth.dart' as auth;

class PageHandler extends ChangeNotifier {
  static const EXTERN = "extern";
  static const OVERVIEW = "overview";
  static const CALENDAR = "calendar";
  static const SETTINGS = "settings";
  static const ACCOUNT = "account";

  var formData;

  bool loggedIn = true;
  // maybe some user id for crud on his acc

  String _currentPage = EXTERN;
  int _subpage = 0;

  String get page => _currentPage;
  int get subpage => _subpage;

  void loginUser(String email, String password) async {
    int det = await auth.saveLogin(email, password);
    if (det == 0) {
    loggedIn = true;
    _currentPage = OVERVIEW;
    notifyListeners();
    }
  }

  void toPage(String page) {
    _currentPage = page;
    notifyListeners();
  }

  void toSubpage(int subpage) {
    _subpage = subpage;
    notifyListeners();
  }

  List<Widget> buildActions(ThemeManager _themeManager) {
    if (!this.loggedIn) {
      return [];
    }
    return [
      IconButton(onPressed: () => {}, icon: Icon(Icons.calendar_month)),
      Expanded(child: Container()),
      IconButton(
        onPressed: () => this.toPage(PageHandler.SETTINGS),
        icon: Icon(Icons.settings),
      ),
      IconButton(
        onPressed: () => this.toPage(PageHandler.ACCOUNT),
        icon: Icon(Icons.account_box),
      ),
      IconButton(onPressed: () => this.toPage(page), icon: Icon(Icons.logout)),
      IconButton(
        onPressed: () =>
            {_themeManager.toggleTheme(!_themeManager.isDarkMode()), notifyListeners() },
        icon: _themeManager.isDarkMode()
            ? Icon(Icons.dark_mode_rounded)
            : Icon(Icons.light_mode_rounded),
      )
    ];
  }

  Widget buildBody(ThemeManager _themeManager) {
    Widget result = Container();
    if (!loggedIn) {
      formData = LoginFormData();
      result = login();
    } else {
      switch (_currentPage) {
        case PageHandler.EXTERN:
          switch (subpage){
            case 1: signup();
            default: formData = LoginFormData(); result = login();
          }
        case PageHandler.OVERVIEW:
          result = Row(children: [
            Text("Hey"),
            SizedBox(
              width: 170,
              height: 60,
              child: TextField(
                decoration: InputDecoration(labelText: "email"),
                onChanged: (s) => {},
              ),
            ),
          ]);
      }
    }
    return result;
  }

  Widget login() {
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
                      controller: emailController,
                      decoration: InputDecoration(labelText: "email"),
                      onChanged: (s) => {formData.mail = s, notifyListeners()},
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
                      controller: passController,
                      decoration: InputDecoration(labelText: "password"),
                      onChanged: (s) => {formData.password = s, notifyListeners()},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () => loginUser(formData.mail, formData.password),
                      child: Text("login")),
                  Container(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => toSubpage(1),
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

  Widget signup() {
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
