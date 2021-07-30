import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Docs Appointment',
      theme: ThemeData(
      ),
      home: Home(),
    );
  }
}