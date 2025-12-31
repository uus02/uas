import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/features/dashboard/presentation/pages/main_screen.dart';
import 'package:lms/features/quiz/presentation/pages/quiz_info_screen.dart'; // To restart
import 'package:lms/features/quiz/presentation/pages/quiz_review_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hasil Kuis"), // Or "Quiz Review 1" context
        backgroundColor: kPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
             const Padding(
               padding: EdgeInsets.symmetric(vertical: 32.0),
               child: Text(
                 "Nilai Akhir Anda Untuk Kuis Ini Adalah\n85.0 / 100.00",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                   color: kTextColor,
                   height: 1.4,
                 ),
               ),
             ),
             
             // Summary Table
             Container(
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey.shade300),
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Column(
                 children: [
                   _buildRow("Status", "Selesai", isBoldValue: true),
                   _buildRow("Waktu", "31 Des 2025, 10:15 WIB"),
                   _buildRow("Nilai", "85,0", isBoldValue: true),
                   // Action Row
                   Container(
                     padding: const EdgeInsets.all(16),
                     decoration: const BoxDecoration(
                       color: Colors.white,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Text(
                           "Review",
                           style: TextStyle(fontWeight: FontWeight.bold),
                         ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const QuizReviewScreen()),
                             );
                           },
                           child: const Text(
                             "Tinjau Kembali",
                             style: TextStyle(
                               color: Colors.blue,
                               fontWeight: FontWeight.bold,
                               decoration: TextDecoration.underline,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             
             const SizedBox(height: 48),
             
             // Buttons
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey[200],
                   foregroundColor: Colors.black87,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   elevation: 0,
                 ),
                 onPressed: () {
                   // Restart Logic: Pop until detail, then push info or just push Info
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(builder: (context) => const QuizInfoScreen()),
                   );
                 },
                 child: const Text("Ambil Kuis Lagi"),
               ),
             ),
             const SizedBox(height: 16),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey[200],
                   foregroundColor: Colors.black87,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   elevation: 0,
                 ),
                 onPressed: () {
                    // Back to Class (Main Screen index 1 or My Classes)
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MainScreen()), 
                      (Route<dynamic> route) => false,
                    );
                 },
                 child: const Text("Kembali Ke Kelas"),
               ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBoldValue = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            value, 
            style: TextStyle(
              fontWeight: isBoldValue ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87
            )
          ),
        ],
      ),
    );
  }
}
