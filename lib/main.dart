import 'package:flutter/material.dart';
import 'package:sistema_votacion/screens/sistema_votacion_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VotacionesScreen()
    );
  }
}
