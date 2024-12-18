import 'package:flutter/material.dart';
import 'package:food_app/Screens/First_Screen/Platters.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:PlattersScreen(),
    );
  }
}
