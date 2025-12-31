import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/features/quiz/presentation/pages/quiz_screen.dart';

class QuizInfoScreen extends StatelessWidget {
  const QuizInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Quiz Review 1"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Silahkan kerjakan kuis ini dengan jujur dan teliti. Waktu akan berjalan otomatis saat Anda menekan tombol Ambil Kuis.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            
            // Container Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.timer, "Batas Waktu", "15 Menit"),
                  const Divider(height: 24),
                  _buildInfoRow(Icons.grade, "Metode Penilaian", "Nilai Tertinggi"),
                  const Divider(height: 24),
                  _buildInfoRow(Icons.refresh, "Percobaan Diizinkan", "3 Kali"),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            const Text(
              "Riwayat Percobaan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Dummy History Table
            Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  children: const [
                    Padding(padding: EdgeInsets.all(8), child: Text("Kuis")),
                    Padding(padding: EdgeInsets.all(8), child: Text("Status")),
                    Padding(padding: EdgeInsets.all(8), child: Text("Nilai / 100")),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8), child: Text("1")),
                    Padding(padding: EdgeInsets.all(8), child: Text("Selesai")),
                    Padding(padding: EdgeInsets.all(8), child: Text("80")),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 48),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                child: const Text("Ambil Kuis"),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.grey),
                  foregroundColor: kTextColor,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Kembali Ke Kelas"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          ],
        )
      ],
    );
  }
}
