import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/features/authentication/presentation/pages/login_screen.dart'; // For logout
import 'package:lms/features/my_classes/presentation/pages/my_classes_screen.dart'; // Reuse for Kelas tab concept or just copy dummy

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double headerHeight = size.height * 0.35; 

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Background Merah di Atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
            child: Container(
              color: kPrimaryColor,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // AppBar Custom manually built to handle back stroke
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Spacer(),
                          const Text(
                            "Profile", 
                            style: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(), // Balance center based on back icon width
                          const SizedBox(width: 48), // Placeholder for symmetry
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Foto Profil
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 46,
                          backgroundColor: kSurfaceColor,
                          child: const Icon(Icons.person, size: 50, color: kPrimaryColor),
                          // Use Image.asset if available: backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Nama Mahasiswa
                      const Text(
                        "Mahasiswa Teladan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Teknik Informatika",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 2. Kartu Putih Menumpuk (Overlapping)
          Positioned(
            top: headerHeight - 40, // Naik sedikit
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    // Tab Bar in White Card
                    const TabBar(
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: kPrimaryColor,
                      tabs: [
                        Tab(text: "About Me"),
                        Tab(text: "Kelas"),
                        Tab(text: "Edit Profile"),
                      ],
                    ),
                    const Divider(height: 1),
                    // Body TabView
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Tab 1: About Me
                          _buildAboutMeTab(context),
                          
                          // Tab 2: Kelas (Simple list)
                          _buildClassesTab(),

                          // Tab 3: Edit Profile
                          _buildEditProfileTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Email Address", "mahasiswa@univ.ac.id"),
          _buildInfoRow("Program Studi", "S1 Teknik Informatika"),
          _buildInfoRow("Fakultas", "Ilmu Komputer"),
          _buildInfoRow("NIM", "1234567890"),
          _buildInfoRow("Aktivitas Login", "Terakhir: 31 Des 2025, 10:00 WIB"),
          
          const SizedBox(height: 48),
          
          // Button Log Out
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Implement Log Out
                // Clear session if any
                // Nav to Login
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildClassesTab() {
    // Reuse basic list logic or simplified
    final classes = ["UI/UX Design", "Pemrograman Mobile", "Sistem Operasi", "Basis Data"];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: kSurfaceColor,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.school, color: kPrimaryColor),
            title: Text(classes[index]),
            subtitle: const Text("Sedang Berlangsung"),
          ),
        );
      },
    );
  }

  Widget _buildEditProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextFormField(
            initialValue: "Mahasiswa",
            decoration: const InputDecoration(labelText: "Nama Depan", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: "Teladan",
            decoration: const InputDecoration(labelText: "Nama Belakang", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: "mahasiswa@univ.ac.id",
            decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: "Deskripsi Diri", 
              border: OutlineInputBorder(),
              hintText: "Tuliskan sedikit tentang dirimu...",
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Dummy save
              }, 
              child: const Text("Simpan"),
            ),
          ),
        ],
      ),
    );
  }
}
