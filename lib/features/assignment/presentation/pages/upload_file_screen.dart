import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/features/assignment/presentation/pages/task_detail_screen.dart'; // Just for context, not modifying

class UploadFileScreen extends StatelessWidget {
  const UploadFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Upload File"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Maksimum File 5MB (PDF, DOCX, ZIP)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            
            // Area Upload (Dashed Border)
            CustomPaint(
              painter: DashedBorderPainter(color: Colors.grey, strokeWidth: 2, gap: 5),
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.grey[50], // Light background
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload, size: 64, color: Colors.blueAccent),
                    SizedBox(height: 16),
                    Text(
                      "File yang akan diupload tampil di sini",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 48),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Trigger File Picker (Dummy)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("File Picker opened... selected 'Tugas_UAS.pdf'")),
                      );
                    },
                    child: const Text("Pilih File"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300], // Initially disabled look but clickable for dummy
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Save Logic
                      Navigator.pop(context); // Go back after simple save
                    },
                    child: const Text("Simpan"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for Dashed Border
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedBorderPainter({required this.color, this.strokeWidth = 2.0, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path dashPath = Path();
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + 10), // Dash length 10
          Offset.zero,
        );
        distance += 10 + gap;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
