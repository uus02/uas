import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Notifikasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Because this is a tab, popping might exit the app or do nothing depending on navigation stack.
            // But obeying user request to have the icon.
            // If pushed from somewhere else, it works. If in tab, it might need to switch to Home or do nothing.
            // For now, we'll just try to pop or switch to index 0 if valid.
            // Since it's a root tab, maybe we just don't have an action or we switch to home.
            // A common pattern is switching to the first tab.
            final state = context.findAncestorStateOfType<State<StatefulWidget>>(); 
            // Finding MainScreenState is tricky without a clear key or provider. 
            // Simple pop for now, if it allows.
             if (Navigator.canPop(context)) {
               Navigator.pop(context);
             } else {
               // Assuming this is inside MainScreen BottomNav, maybe we want to go back to Home?
               // But usually tabs don't have back buttons.
               // We will leave the onPressed empty or simple print for clarity if it's a tab.
             }
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            color: Colors.white,
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  index % 2 == 0 ? Icons.assignment : Icons.notifications_active,
                  color: kPrimaryColor,
                ),
              ),
              title: Text(
                index % 2 == 0 
                  ? "Anda telah mengirimkan tugas Pertemuan ${index + 1}" 
                  : "Materi baru telah ditambahkan pada Kelas UI/UX",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "${index + 2} Hari ${index + 5} Jam Yang Lalu",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
