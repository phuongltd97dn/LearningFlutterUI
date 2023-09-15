import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Budget UI',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
