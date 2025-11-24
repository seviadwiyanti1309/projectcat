import 'package:flutter/material.dart';
import 'catty_store_page.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // biar bisa discroll di HP kecil
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian atas: gambar + judul
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.from(
                          alpha: 1,
                          red: 0.769,
                          green: 0.518,
                          blue: 0.812), // ungu muda
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Don't forget to take care of your catty",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/catt2.png', // ganti dengan gambar kucing kamu
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              // Bagian bawah (form input)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(100)),
                ),
                child: Column(
                  children: [
                    _buildTextField("Username"),
                    const SizedBox(height: 12),
                    _buildPasswordField("Password", _obscurePassword, () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    }),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainNavigationPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Or"),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon('assets/google.png'),
                        const SizedBox(width: 15),
                        _buildSocialIcon('assets/twitter.png'),
                        const SizedBox(width: 15),
                        _buildSocialIcon('assets/facebook.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Helper untuk text field biasa
  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  // 🔹 Helper untuk field password
  Widget _buildPasswordField(
      String hint, bool obscure, VoidCallback toggleVisibility) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(obscure
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }

  // 🔹 Helper untuk icon sosial media
  Widget _buildSocialIcon(String path) {
    return InkWell(
      onTap: () {},
      child: Image.asset(path, width: 40),
    );
  }
}
