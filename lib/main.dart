import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.grey.shade500),
          bodyText2: TextStyle(color: Colors.grey.shade300),
          headline3: TextStyle(color: Colors.grey.shade300),
          headline5: TextStyle(color: Colors.grey.shade300),
          headline6: TextStyle(color: Colors.grey.shade300),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
