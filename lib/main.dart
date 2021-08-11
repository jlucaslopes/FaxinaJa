import 'package:faxina_ja_app/screens/login/loginPage.dart';
import 'package:faxina_ja_app/screens/main/MainScreen.dart';
import 'package:faxina_ja_app/screens/main/screens/profile/MyProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Color.fromRGBO(55, 10, 91, 100),
        ),
        routes: {
          'LoginPage': (context) => LoginPage(),
          'MyProfile': (context) => MyProfile(),
          'MainScreen': (context) => MainScreen(),
        },
        showSemanticsDebugger: false,
        home: LoginPage());
  }
}
