import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseName;
  final String lecturerName;

  const CourseDetailScreen({
    super.key,
    required this.courseName,
    required this.lecturerName,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(courseName),
          backgroundColor: kPrimaryColor,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: "Materi"),
              Tab(text: "Tugas Dan Kuis"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Materi
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 8, // Dummy 8 Pertemuan
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: ExpansionTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "P",
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      "Pertemuan ${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Pengenalan dan Kontrak Kuliah"),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                              title: const Text("Slide Presentasi.pdf"),
                              trailing: const Icon(Icons.check_circle, color: kAccentColor, size: 20),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.video_library, color: Colors.blue),
                              title: const Text("Rekaman Kelas"),
                              trailing: const Icon(Icons.check_circle, color: kAccentColor, size: 20),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Tab Tugas
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 4, // Dummy 4 Tugas
              itemBuilder: (context, index) {
                 final isDone = index % 2 == 0; // Dummy status
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDone ? kAccentColor.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.assignment, 
                        color: isDone ? kAccentColor : Colors.orange
                      ),
                    ),
                    title: Text("Tugas ${index + 1}: Analisis User Flow"),
                    subtitle: Text("Deadline: ${10 + index} Jan 2026"),
                    trailing: isDone 
                      ? const Icon(Icons.check_circle, color: kAccentColor)
                      : const Icon(Icons.circle_outlined, color: Colors.grey),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
