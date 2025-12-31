import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';
import 'package:lms/shared/widgets/course_card.dart';
import 'package:lms/features/my_classes/presentation/pages/course_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  final List<Map<String, dynamic>> courses = const [
    {
      "name": "UI/UX Design",
      "lecturer": "Dr. Budi Santoso",
      "initial": "UI",
      "progress": 0.75,
    },
    {
      "name": "Sistem Operasi",
      "lecturer": "Siti Aminah, M.Kom",
      "initial": "SO",
      "progress": 0.4,
    },
    {
      "name": "Kewarganegaraan",
      "lecturer": "Drs. Ahmad Yani",
      "initial": "KW",
      "progress": 0.9,
    },
    {
      "name": "Multimedia",
      "lecturer": "Rina Wijaya, S.Ds",
      "initial": "MM",
      "progress": 0.6,
    },
    {
      "name": "Bahasa Inggris",
      "lecturer": "John Doe, M.Ed",
      "initial": "BI",
      "progress": 0.8,
    },
    {
      "name": "Olah Raga",
      "lecturer": "Bambang Pamungkas",
      "initial": "OR",
      "progress": 0.2,
    },
    {
      "name": "Pemrograman Web",
      "lecturer": "Eko Kurniawan",
      "initial": "PW",
      "progress": 0.55,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kelas Saya",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Similar to Notification, navigation back logic if needed
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(
            courseName: course["name"],
            lecturerName: course["lecturer"],
            courseInitial: course["initial"],
            progress: course["progress"],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    courseName: course["name"],
                    lecturerName: course["lecturer"],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
