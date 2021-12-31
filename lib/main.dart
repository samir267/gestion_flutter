import 'package:flutter/material.dart';
import 'package:gest/pages/login.dart';
import 'package:gest/pages/signup.dart';
import 'package:gest/pages/logged.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projet Flutter',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        '/singup': (context) => singup(),
        '/logged': (context) => loged(),


      },
    );
  }
}
