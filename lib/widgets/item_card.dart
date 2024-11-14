import 'package:flutter/material.dart';
import 'package:wisata_candi_fahri/models/candi.dart';
import 'package:wisata_candi_fahri/screens/detail_screen.dart';

class ItemCard extends StatefulWidget {
  //TODO 1. Deklarasikan variabel yg dibutuhkan dan pasang pada konstruktor
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    //TODO 6. Implementasi Routing ke DetailScreen
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => DetailScreen(candi: widget.candi)));
      },
      child: Card(
        //TODO 2. Tetapkan parameter shape, margin, dan elevation dari cari
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO 3. Buat image sebagai anak dari column
            Expanded(
              // TODO 7. Implementasi Hero Animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
            //TODO 4. Buat text sebagai anak dari column
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                widget.candi.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //TODO 5. Buat text sebagai anak dari column
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                widget.candi.type,
                style: const TextStyle(
                  fontSize: 12
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
