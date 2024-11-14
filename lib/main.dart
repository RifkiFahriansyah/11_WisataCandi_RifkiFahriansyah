import 'package:flutter/material.dart';
import 'package:wisata_candi_fahri/data/candi_data.dart';
import 'package:wisata_candi_fahri/screens/detail_screen.dart';
import 'package:wisata_candi_fahri/screens/favorite_screen.dart';
import 'package:wisata_candi_fahri/screens/home_screen.dart';
import 'package:wisata_candi_fahri/screens/profile_screen.dart';
import 'package:wisata_candi_fahri/screens/search_screens.dart';
import 'package:wisata_candi_fahri/screens/sign_in_screen.dart';
import 'package:wisata_candi_fahri/screens/sign_up_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Candi",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO 1. Deklarasikan Variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreens(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Buat properti body berupa widget yg ditampilkan
      body: _children[_currentIndex],
      // TODO 3. Buat properti bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex, onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: "Profile",
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),
      ),
      // TODO 4. Buat data dan child dari Theme
    );
  }
}
