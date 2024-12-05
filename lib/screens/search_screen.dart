import 'package:flutter/material.dart';
import 'package:wisata_candi_fahri/models/candi.dart';
import 'package:wisata_candi_fahri/data/candi_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //  TODO: 1. Deklarasilkan variabel yang dibutuhkan
  List<Candi> _filteredCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  // void initState() {
  //   super.initState();
  //   // Tambahkan listener untuk TextField
  //   _searchController.addListener(_onSearchChanged);
  // }

  // @override
  // void dispose() {
  //   // Hapus listener ketika widget dihapus
  //   _searchController.removeListener(_onSearchChanged);
  //   _searchController.dispose();
  //   super.dispose();
  // }

  // void _onSearchChanged() {
  //   setState(() {
  //     _searchQuery = _searchController.text.toLowerCase();
  //     // Filter data berdasarkan query
  //     _filteredCandis = candiList.where((candi) {
  //       return candi.name.toLowerCase().contains(_searchQuery) ||
  //           candi.location.toLowerCase().contains(_searchQuery);
  //     }).toList();
  //   });
  // }
  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
      _filteredCandis = candiList
          .where((candi) =>
              candi.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat Appbar dengan judul Pencarian Candi
      appBar: AppBar(
        title: Text('Pencarian Candi'),
      ),
      // TODO: 3. Buat body berupa Column
      body: Column(
        children: [
          // TODO: 4. Buat TextField pencarian sebagai anak dari column
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.deepPurple[50]),
              child: TextField(
                onChanged: _updateSearchQuery,
                controller: _searchController,
                autofocus: false,
                // TODO: 6. Implementasi Fitur Pencarian
                decoration: const InputDecoration(
                    hintText: 'Cari Candi ...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
              ),
            ),
          ),
          // TODO: 5. Buat ListView hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                // TODO: 8. Implementasi GestureDetector dan Hero Animation
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            candi.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              candi.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(candi.location)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}