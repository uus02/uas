import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'dart:async';
import 'package:lms/features/quiz/presentation/pages/quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Timer Logic
  int _secondsRemaining = 900; // 15 minutes
  late Timer _timer;
  
  // Selection Logic
  int _selectedOptionIndex = -1; // -1 means no selection
  final int _currentQuestionIndex = 0; // 0-indexed, so Question 1 is index 0

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          // Logic for timeout
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Quiz Review 1"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  timerText, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Question Navigator
          Container(
            height: 80,
            color: Colors.grey[50],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: 15,
              itemBuilder: (context, index) {
                // Highlight logic
                bool isActive = index == _currentQuestionIndex; 
                // In real app, check if answered to color generic completed bubbles
                
                return Container(
                  width: 40,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isActive ? kAccentColor : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? kAccentColor : Colors.grey.shade400,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Soal Nomor ${_currentQuestionIndex + 1} / 15",
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Radio button dapat digunakan untuk menentukan?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.4),
                  ),
                  const SizedBox(height: 32),
                  
                  // Options
                  _buildOption(0, "A", "Input satu pilihan dari banyak pilihan"),
                  _buildOption(1, "B", "Input banyak pilihan dari banyak pilihan"),
                  _buildOption(2, "C", "Input data teks bebas"),
                  _buildOption(3, "D", "Input data password"),
                  _buildOption(4, "E", "Input data tanggal"),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    // Next Question Logic or Finish
                    // For demo, if we click next, we just show result if it were real
                    // Let's mimic "Selesai" if it was the last question
                    // Or just a direct navigation for this demo flow
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizResultScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      // Hardcoded for demo to pretend last question
                      const Text("Selesai"), // Changed from "Soal Selanjutnya" for demo flow
                      const SizedBox(width: 8),
                      const Icon(Icons.check_circle, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(int index, String label, String text) {
    bool isSelected = _selectedOptionIndex == index;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedOptionIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.grey.shade300, 
              width: 1.5,
            ),
            boxShadow: isSelected ? [
              BoxShadow(color: kPrimaryColor.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))
            ] : [],
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withOpacity(0.2) : Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
