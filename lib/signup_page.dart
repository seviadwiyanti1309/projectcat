import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // biar bisa discroll di layar kecil
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🟣 Bagian atas (latar ungu + gambar + judul)
              Stack(
                children: [
                  Container(
                    height: 340, // tinggi ungu
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(196, 160, 207, 1), // ungu muda
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Let's find your playmates here!",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // bisa kamu sesuaikan: makin kecil = makin ke atas
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/catt.png',
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              // ⚪ Bagian bawah (form input)
              Transform.translate(
                offset: const Offset(0, -40), // naikkan biar nempel ke ungu
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildTextField("Email"),
                      const SizedBox(height: 12),
                      _buildTextField("Username"),
                      const SizedBox(height: 12),
                      _buildPasswordField(
                        "Password",
                        _obscurePassword,
                        () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      _buildPasswordField(
                        "Confirm your Password",
                        _obscureConfirmPassword,
                        () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      const SizedBox(height: 25),

                      // 🔘 Tombol Create Account
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 15,
                          ),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text("Or"),
                      const SizedBox(height: 15),

                      // 🔹 Ikon sosial media
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🧩 Input field biasa
  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  // 🧩 Input field password
  Widget _buildPasswordField(
      String hint, bool obscure, VoidCallback toggleVisibility) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }

  // 🧩 Ikon media sosial
  Widget _buildSocialIcon(String path) {
    return InkWell(
      onTap: () {},
      child: Image.asset(path, width: 40),
    );
  }
}
