import 'package:flutter/material.dart';
import 'package:flutter_social_new/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      title: 'Flutter Social UI',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
