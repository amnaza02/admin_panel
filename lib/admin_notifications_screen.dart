import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminNotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Login Detected',
      'description': 'A new login from an unknown device.',
      'icon': '🔑'
    },
    {
      'title': 'Support Request',
      'description': 'A user has submitted a new support request.',
      'icon': '📩'
    },
    {
      'title': 'New Purchase',
      'description': 'A customer made a new purchase.',
      'icon': '💰'
    },
    {
      'title': 'Security Alert',
      'description': 'Multiple failed login attempts detected.',
      'icon': '⚠️'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Text(
                notification['icon']!,
                style: GoogleFonts.poppins(fontSize: 24),
              ),
              title: Text(
                notification['title']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                notification['description']!,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              trailing: Icon(Icons.notifications),
            ),
          );
        },
      ),
    );
  }
}
