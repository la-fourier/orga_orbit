import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageHandler extends ChangeNotifier {
  // VarName corresponds with path
  static const PAGE1 = 'Page 1';
  static const PAGE2 = 'Page 2';
  static const CALENDAR = "calendar";
  static const SETTINGS = "settings";
  static const ACCOUNT = "account";

  var darkTheme = false;

  late User user;
  bool loggedIn = true;

  String _currentPage = PAGE1;
  int _subpage = 0;

  String get page => _currentPage;
  int get subpage => _subpage;

  void setUser(Future<User?> user) async {
    final User? usr = await user;
    final User usr_ = usr!;
    this.user = usr_;
    _currentPage = PAGE1;
    notifyListeners();
  }

  void toPage(String page) {
    _currentPage = page;
    notifyListeners();
  }

  void toSubpage(int subpage) {
    _subpage = subpage;
    notifyListeners();
  }

  List<Widget> buildActions() {
    if (!this.loggedIn) {
      return [];
    }
    return [
      IconButton(onPressed: () => {}, icon: Icon(Icons.calendar_month)),
      Expanded(child: Container()),
      IconButton(
        onPressed: () => this.toPage(PageHandler.PAGE1),
        icon: Icon(Icons.settings),
      ),
      IconButton(
        onPressed: () => this.toPage(PageHandler.PAGE2),
        icon: Icon(Icons.account_box),
      ),
      IconButton(onPressed: () => this.toPage(page), icon: Icon(Icons.logout)),
      IconButton(
        onPressed: () => {darkTheme = (!darkTheme), notifyListeners()},
        icon: darkTheme == true
            ? Icon(Icons.dark_mode_rounded)
            : Icon(Icons.light_mode_rounded),
      )
    ];
  }

  Widget buildBody() {
    Widget result = Container();
    switch (_currentPage) {
      case PageHandler.PAGE1:
        result = Text("Hey");
    }
    return result;
  }
}
