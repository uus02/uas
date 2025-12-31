import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/shared/widgets/course_card.dart';
import 'package:lms/features/my_classes/presentation/pages/course_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24), // Top spacing for status bar usually handled by SafeArea, but adding buffer.
          
          // Header: Row berisi Teks "Hallo, [Nama Mahasiswa]" dan Avatar/Icon User di kanan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, Mahasiswa",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  Text(
                    "Selamat Datang Kembali",
                    style: TextStyle(
                      fontSize: 14,
                      color: kTextLightColor,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: kSurfaceColor,
                child: const Icon(Icons.person, color: kPrimaryColor),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Kartu Tugas (Merah)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tugas Prioritas",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Desain Antarmuka Pengguna",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Tugas 01 - Prototyping",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "Waktu Pengumpulan: Hari ini, 23:59",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Pengumuman
          const Text(
            "Pengumuman Terakhir",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
          const SizedBox(height: 16),
          // Gambar banner placeholder
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/kampus.png'), // Reuse kampus image if available
                fit: BoxFit.cover,
                // If not available, it will show grey background from color prop until error builder kicks in? 
                // Creating a robust placeholder:
              ),
            ),
            child: Stack(
              children: [
                 // Add logic or widget to handle image not found explicitly if needed, but BoxDecoration handles it gracefully mostly by showing color if image fails loading usually or we can use Image.asset inside.
                 // Using Image.asset inside for better error handling visibility
                 Positioned.fill(
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(12),
                     child: Image.asset(
                       'assets/images/kampus.png',
                       fit: BoxFit.cover,
                       errorBuilder: (context, error, stackTrace) {
                         return Container(
                           color: Colors.grey[300],
                           child: const Center(
                             child: Icon(Icons.announcement, size: 50, color: Colors.grey),
                           ),
                         );
                       },
                     ),
                   ),
                 ),
                 Positioned(
                   bottom: 0,
                   left: 0,
                   right: 0,
                   child: Container(
                     padding: const EdgeInsets.all(12),
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                         colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                         begin: Alignment.bottomCenter,
                         end: Alignment.topCenter,
                       ),
                       borderRadius: const BorderRadius.only(
                         bottomLeft: Radius.circular(12),
                         bottomRight: Radius.circular(12),
                       ),
                     ),
                     child: const Text(
                       "Jadwal Libur Semester Genap",
                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                     ),
                   ),
                 )
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Progres Kelas
          const Text(
            "Progres Kelas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
          const SizedBox(height: 16),
          // List vertikal mata kuliah
          Column(
            children: [
              CourseCard(
                courseName: "Pemrograman Mobile",
                lecturerName: "Dr. Budi Santoso",
                courseInitial: "PM",
                progress: 0.75,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseDetailScreen(courseName: "Pemrograman Mobile", lecturerName: "Dr. Budi Santoso"))),
              ),
              CourseCard(
                courseName: "Basis Data Lanjut",
                lecturerName: "Siti Aminah, M.Kom",
                courseInitial: "BD",
                progress: 0.5,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseDetailScreen(courseName: "Basis Data Lanjut", lecturerName: "Siti Aminah, M.Kom"))),
              ),
              CourseCard(
                courseName: "Jaringan Komputer",
                lecturerName: "Agus Setiawan, MT",
                courseInitial: "JK",
                progress: 0.3,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseDetailScreen(courseName: "Jaringan Komputer", lecturerName: "Agus Setiawan, MT"))),
              ),
              CourseCard(
                courseName: "Kecerdasan Buatan",
                lecturerName: "Prof. Rina Wijaya",
                courseInitial: "AI",
                progress: 0.9,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseDetailScreen(courseName: "Kecerdasan Buatan", lecturerName: "Prof. Rina Wijaya"))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
