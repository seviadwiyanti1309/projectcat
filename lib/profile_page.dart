import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Name";
  String phoneNumber = "0888 - 2213 - 1234";
  String profileImage = ""; // Kosongkan untuk placeholder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Purple Section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFB39BC8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Spacer(),
                        // Status bar icons
                        Icon(Icons.signal_cellular_4_bar, size: 18),
                        SizedBox(width: 4),
                        Icon(Icons.battery_full, size: 20),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                // Profile Card
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey.shade300,
                        child: profileImage.isEmpty
                            ? Icon(Icons.person,
                                size: 40, color: Colors.grey.shade500)
                            : null,
                        backgroundImage: profileImage.isNotEmpty
                            ? NetworkImage(profileImage)
                            : null,
                      ),
                      SizedBox(width: 16),
                      // Name and Phone
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              phoneNumber,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Edit Button
                      TextButton(
                        onPressed: () {
                          // Handle edit profile
                          _showEditDialog();
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: Color(0xFF7B68EE),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Account Section
                _buildSectionTitle("Account"),
                _buildMenuItem("Email", Icons.chevron_right, () {}),
                _buildMenuItem("Change Password", Icons.chevron_right, () {}),
                _buildMenuItem("History", Icons.chevron_right, () {}),

                SizedBox(height: 20),

                // General Section
                _buildSectionTitle("General"),
                _buildMenuItem("Language", Icons.chevron_right, () {}),
                _buildMenuItem("Settings", Icons.chevron_right, () {}),
                _buildMenuItem("Help", Icons.chevron_right, () {}),

                SizedBox(height: 20),

                // About Section
                _buildSectionTitle("About"),
                _buildMenuItem("Privacy Policy", Icons.chevron_right, () {}),
                _buildMenuItem(
                    "Terms & Conditions", Icons.chevron_right, () {}),

                SizedBox(height: 30),

                // Sign Out Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OutlinedButton(
                    onPressed: () {
                      _showSignOutDialog();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(color: Colors.grey.shade400, width: 1.5),
                    ),
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      String title, IconData trailingIcon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Icon(trailingIcon, size: 20, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Name"),
              controller: TextEditingController(text: userName),
              onChanged: (value) => userName = value,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
              controller: TextEditingController(text: phoneNumber),
              onChanged: (value) => phoneNumber = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Sign Out"),
        content: Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle sign out
            },
            child: Text("Sign Out", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
