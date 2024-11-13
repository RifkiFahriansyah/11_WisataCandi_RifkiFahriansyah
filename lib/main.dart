import 'package:flutter/material.dart';
import 'package:wisata_candi_fahri/data/candi_data.dart';
import 'package:wisata_candi_fahri/screens/detail_screen.dart';
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
        appBarTheme: AppBarTheme(
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
      //Home : DetailScreen(candi: candiList[0]),
      //Home : const ProfileScreen(),
      // home: SignInScreen(),
      // home: SignUpScreen(),
      home: SearchScreens(),
    );
  }
}
