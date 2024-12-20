import 'package:flutter/material.dart';
import 'package:wisata_candi_fahri/data/candi_data.dart';
import 'package:wisata_candi_fahri/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 1. Buat appBar dengan judul wisata Candi
      appBar: AppBar(
        title: const Text("Wisata Candi"),
        automaticallyImplyLeading: false,
      ),
      //TODO 2. Buat body dengan GridView.builder
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          padding: const EdgeInsets.all(8),
          itemCount: candiList.length,
          itemBuilder: (context, index) {
            return ItemCard(candi: candiList[index]);
          }),
      //TODO 3. Buat ItemCard sebagai return value dari GridView.builder
    );
  }
}
