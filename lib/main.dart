import 'package:flutter/material.dart';
import 'package:wisata_candi_wahyu/data/candi_data.dart';
import 'package:wisata_candi_wahyu/screens/detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: DetailScreen(candi: candiList[0]), 
    );
  }
}