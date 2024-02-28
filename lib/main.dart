import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'styles.dart';

// TODO: Loading, Badges(mit News-Zahl), Pushes, Sync-Badge

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageModel handler = context.read<PageModel>();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: primaryColor,
        focusColor: accentColor,
        highlightColor: secondaryColor,
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PageModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Page Handling with Provider'),
            actions: [
              IconButton(onPressed: () => handler.navigateToPage(PageModel.PAGE1), icon: Icon(Icons.settings)),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                handler.buildBody(),
                ElevatedButton(
                  onPressed: () => handler.navigateToPage(PageModel.PAGE1),
                  child: Text('Go to Page 1'),
                ),
                ElevatedButton(
                  onPressed: () => handler.navigateToPage(PageModel.PAGE2),
                  child: Text('Go to Page 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageModel extends ChangeNotifier {
  static const PAGE1 = 'Page 1';
  static const PAGE2 = 'Page 2';

  String _currentPage = PAGE1;

  String get page => _currentPage;

  void navigateToPage(String page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget buildBody() {
    Widget result = Container();
    switch (_currentPage) {
      case 'Page 1': result = Container();
    }
    return result;
  }
}