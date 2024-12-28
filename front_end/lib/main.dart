import 'package:flutter/material.dart';
import 'package:front_end/screen/main/screen_controller.dart';
import 'package:front_end/screen/sign/screen_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeaMinCC',
      theme: ThemeData(fontFamily: 'Moneygraphy'),
      home: ControllerScreen(),
    );
  }
}
