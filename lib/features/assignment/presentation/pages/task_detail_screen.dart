import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/features/assignment/presentation/pages/upload_file_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  final String taskName;
  final String deadline;

  const TaskDetailScreen({
    super.key, 
    required this.taskName,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(taskName),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deskripsi Tugas
            const Text(
              "Instruksi Tugas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "Buatlah analisis User Flow untuk aplikasi E-Commerce sederhana. "
              "Gambarkan diagram alur dari mulai Login hingga Checkout. "
              "Format file yang dikumpulkan adalah PDF dengan ukuran maksimal 5MB. "
              "Pastikan diagram mudah dipahami dan mengikuti kaidah UX yang benar.",
              style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 32),

            // Bagian Status Tugas
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: kPrimaryColor, // Merah muda/light logic handled via const usually, using primary for now or lighter shade if preferred?
                      // User said "Merah muda" header. kPrimaryLightColor exists.
                      color: kPrimaryLightColor, 
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8), 
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Status Tugas",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Table Rows
                  _buildStatusRow("Status Pengumpulan", "Belum Dikumpulkan", isValueRed: true),
                  _buildStatusRow("Status Nilai", "Belum Dinilai"),
                  _buildStatusRow("Batas Waktu", deadline),
                  _buildStatusRow("Sisa Waktu", "2 Hari 5 Jam", isLast: true),
                ],
              ),
            ),

            const SizedBox(height: 48),

            // Tombol "Tambahkan Tugas"
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const UploadFileScreen()),
                    );
                  },
                  child: const Text("Tambahkan Tugas"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {bool isLast = false, bool isValueRed = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: Colors.grey.shade200)),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: isValueRed ? Colors.red : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
