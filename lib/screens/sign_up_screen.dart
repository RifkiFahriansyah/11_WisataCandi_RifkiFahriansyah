import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //TODO: 1. Deklrasikan Variable
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";
  bool _isSignedIn = false;
  bool _obscurePassword = false;

  //TODO 1. membuat fungsi _signUp
  void _signUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    if (password.length < 8 ||
        // Tidak mengandung huruf besar A-Z
        !password.contains(RegExp(r'[A-Z]')) ||
        // Tidak mengandung huruf kecil a-z
        !password.contains(RegExp(r'[a-z]')) ||
        // Tidak mengandung angka 0-9
        !password.contains(RegExp(r'[0-9]')) ||
        // Tidak mengandung karakter khusus
        !password.contains(RegExp(r'[@#$%^&*(),.?":{}|<>]'))) {
      // Password invalid

      setState(() {
        (_errorText =
            "Password harus minimal 8 karakter, mengandung huruf besar, huruf kecil, angka, dan karakter khusus");
        return;
      });
      prefs.setString('fulname', name);
      prefs.setString('username', username);
      prefs.setString('password', password);
      Navigator.pushNamed(context, '/signin');
    }
  }

  //TODO 2. membuat fungsi dispose
  void dispose() {
    //TODO: Implement Dispose
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2. Pasang AppBar
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      //TODO 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
              //TODO 4. Atur MainAxisAlignment dan CrossAxisAlignment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TODO 9. Pasang TextFormField Nama
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //TODO 5. Pasang TextFormField Nama Pengguna
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),
                //TODO 6. Pasang TextFormField Kata Sandi
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                //TODO 7. Pasang ElevatedButton Sign In
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {_signUp();},
                  child: const Text("Sign Up"),
                ),
                //TODO 8. Pasang TextButton Sign Up
                SizedBox(
                  height: 20,
                ),
                // TextButton(
                //     onPressed: () {},
                //     child: Text('Belum punya akun? Daftar disini'),
                // ),
                RichText(
                  text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masuk disini',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushNamed(context, '/signin');
                        },
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
