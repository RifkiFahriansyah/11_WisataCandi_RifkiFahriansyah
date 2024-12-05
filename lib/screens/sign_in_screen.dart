import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  // Fungsi untuk retrieve dan dekripsi data yang disimpan di SharedPreferences
  Future<Map<String, String>> _retrieveAndDecryptDataFromPrefs(
    Future<SharedPreferences> prefs,
  ) async {
    final sharedPreferences = await prefs;

    final encryptedUsername = sharedPreferences.getString('username') ?? '';
    final encryptedPassword = sharedPreferences.getString('password') ?? '';
    final keyString = sharedPreferences.getString('key') ?? '';
    final ivString = sharedPreferences.getString('iv') ?? '';

    if (encryptedUsername.isEmpty ||
        encryptedPassword.isEmpty ||
        keyString.isEmpty ||
        ivString.isEmpty) {
      return {}; // Data tidak valid
    }

    final encrypt.Key key = encrypt.Key.fromBase64(keyString);
    final iv = encrypt.IV.fromBase64(ivString);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decryptedUsername = encrypter.decrypt64(encryptedUsername, iv: iv);
    final decryptedPassword = encrypter.decrypt64(encryptedPassword, iv: iv);

    return {'username': decryptedUsername, 'password': decryptedPassword};
  }

  // Fungsi untuk Sign In
  void _signIn() async {
    final Future<SharedPreferences> prefsFuture =
        SharedPreferences.getInstance();

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      final SharedPreferences prefs = await prefsFuture;
      final data = await _retrieveAndDecryptDataFromPrefs(prefsFuture);

      if (data.isNotEmpty) {
        final decryptedUsername = data['username'];
        final decryptedPassword = data['password'];

        if (decryptedUsername != null && decryptedPassword != null) {
          if (username == decryptedUsername && password == decryptedPassword) {
            setState(() {
              _errorText = '';
              _isSignedIn = true;
            });
            prefs.setBool('isSignedIn', true); // Tandai pengguna sudah login
            Navigator.pushReplacementNamed(context, '/'); // Arahkan ke halaman utama
          } else {
            setState(() {
              _errorText = 'Username or password is incorrect';
            });
          }
        } else {
          setState(() {
            _errorText = 'Decrypted data is invalid';
          });
        }
      } else {
        setState(() {
          _errorText = 'No stored credentials found';
        });
      }
    } else {
      setState(() {
        _errorText = 'Username and password cannot be empty';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signIn,
                    child: const Text("Sign In"),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Daftar disini',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/signup');
                            },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
