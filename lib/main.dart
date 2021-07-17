import 'package:flutter/material.dart';
import 'package:dee_food_delivery/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto Dee',
      home: HomePage(),
    );
  }
}
