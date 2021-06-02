import 'package:firebase_core/firebase_core.dart';
import 'package:flutte_things_todo/screens/home_screen.dart';
import 'package:flutte_things_todo/screens/login_screen.dart';
import 'package:flutte_things_todo/screens/task_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Things Todo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: LoginScreen(),
    );
  }
}
