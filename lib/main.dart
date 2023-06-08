import 'package:flutter/material.dart';
import 'home/home.dart';
void main() {
  runApp(DiaDosNamoradosApp());
}

class DiaDosNamoradosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dia dos Namorados',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DiaDosNamoradosScreen(),
    );
  }
}