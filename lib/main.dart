import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'styles.dart';
import 'pages/handler.dart';

// TODO: Loading, Badges(mit News-Zahl), Pushes, Sync-Badge, Ext. Client-Client Encryption, Key-Peer-To-Peer Transfer
// TODO: Hosting

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageHandler(),
      child: MyApp(),
    ),
  );
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

  // @override
  // void dispose() {
  //   _themeManager.removeListener(themeListener);
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   _themeManager.addListener(themeListener);
  //   super.initState();
  // }

  // themeListener(){
  //   if(mounted){
  //     setState(() {
  //     });
  //   }
  // }
  

  @override
  Widget build(BuildContext context) {
    PageHandler handler = context.read<PageHandler>();
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => PageHandler(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: secondaryColor,
            title: Text('Orga Orbit'),
            actions: handler.buildActions(_themeManager),
          ),
          backgroundColor: backgroundColor,
          body: handler.buildBody(_themeManager),
        ),
      ),
    );
  }
}

