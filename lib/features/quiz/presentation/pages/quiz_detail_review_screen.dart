import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';

class QuizDetailReviewScreen extends StatelessWidget {
  final int questionIndex;

  const QuizDetailReviewScreen({super.key, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Review Jawaban"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pertanyaan $questionIndex / 15",
              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Radio button dapat digunakan untuk menentukan?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.4),
            ),
            const SizedBox(height: 32),
            
            // Options (Diff colors for correct/incorrect logic simulation)
            // Let's assume A was selected (Correct) for demo purposes
            _buildReviewOption("A", "Input satu pilihan dari banyak pilihan", isSelected: true, isCorrect: true),
            _buildReviewOption("B", "Input banyak pilihan dari banyak pilihan"),
            _buildReviewOption("C", "Input data teks bebas"),
            _buildReviewOption("D", "Input data password"),
            _buildReviewOption("E", "Input data tanggal"),
            
            const SizedBox(height: 32),
            
            // Feedback Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pembahasan:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(height: 4),
                  Text("Benar. Radio button digunakan untuk memilih satu opsi dari sekumpulan opsi."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewOption(String label, String text, {bool isSelected = false, bool isCorrect = false}) {
    Color bgColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;

    if (isCorrect) {
      bgColor = Colors.green.withOpacity(0.2);
      borderColor = Colors.green;
    } else if (isSelected && !isCorrect) {
      bgColor = Colors.red.withOpacity(0.2);
      borderColor = Colors.red;
    } else if (isSelected) {
      // Correct and Selected covered above
      bgColor = Colors.green.withOpacity(0.2);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: TextStyle(color: textColor))),
          if (isCorrect) const Icon(Icons.check_circle, color: Colors.green),
          if (isSelected && !isCorrect) const Icon(Icons.cancel, color: Colors.red),
        ],
      ),
    );
  }
}
