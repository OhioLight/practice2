import 'package:flutter/material.dart';

import 'package:practice2/mainscreen/mainscreen.dart';
import 'package:practice2/util/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Coloors.primaryColor,
            title: const Text(
              'Practice',
              style: TextStyle(
                  color: Coloors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          body: const MainScreen()),
    );
  }
}
