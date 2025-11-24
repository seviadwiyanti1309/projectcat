import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================= HEADER UNGU =================
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFD0B7FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Catty’s Store",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Find your Catty’s stuff here",
                      style: TextStyle(color: Colors.white),
                    ),

                    const SizedBox(height: 16),

                    // SEARCH BAR
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search name of stuff',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // ================= END HEADER =================

              const SizedBox(height: 20),

              // ================= FOOD & ACCESSORIES TAB =================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FOOD BUTTON
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB58EFF),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      "Food",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ACCESSORIES BUTTON
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Text(
                      "Accessories",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ================= GRID PRODUK =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.78,
                  children: [
                    buildProduct("assets/bed.png", "Rp.250.000,-"),
                    buildProduct("assets/mainan.png", "Rp.350.000,-"),
                    buildProduct("assets/cat_tree1.png", "Rp.679.900,-"),
                    buildProduct("assets/cat_tree2.png", "Rp.599.900,-"),
                    buildProduct("assets/kalung.png", "Rp.98.900,-"),
                    buildProduct("assets/sisir.png", "Rp.120.000,-"),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // WIDGET PRODUK
  Widget buildProduct(String imagePath, String price) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(price),
      ],
    );
  }
}
