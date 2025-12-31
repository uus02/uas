import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String title;

  const VideoPlayerScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 16)),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Area
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.black, // Background hitam layer dasar
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Simulated visual background (optional, could be opacity image)
                    // Just simple text overlay as requested
                    Positioned.fill(
                      child: Container(
                        color: Colors.black45, // Slightly lighten or maintain black
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "UI DESIGN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    
                    // Controls overlay simulation (bottom)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.black54,
                        child: const Row(
                          children: [
                            Icon(Icons.pause, color: Colors.white),
                            SizedBox(width: 8),
                            Text("10:25 / 45:00", style: TextStyle(color: Colors.white)),
                            Spacer(),
                            Icon(Icons.fullscreen, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Deskripsi Video
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Video rekaman pertemuan tentang prinsip dasar User Interface Design dan pengenalan tools.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),

            // List Playlist / Video Lainnya
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Video Lain Nya",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildVideoItem("Introduction to UX", "12:00"),
                  _buildVideoItem("Wireframing Basics", "25:30"),
                  _buildVideoItem("Prototyping with Figma", "40:15"),
                  _buildVideoItem("Design Systems 101", "35:00"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String title, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/kampus.png'), // Reuse asset
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
