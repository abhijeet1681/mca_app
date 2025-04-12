import 'package:flutter/material.dart';
// import 'package:flutter_clg/home.dart';
import 'package:flutter_clg/visson.dart';
import 'package:flutter_clg/webview_screen.dart';
import 'about.dart';
import 'feedback.dart'; // Ensure this is the correct path to your FeedbackForm file
import 'notification.dart';
import 'faculty.dart';

class SideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo3.0.png', // Change this to the correct logo path
                      height: 40,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _drawerItem("About", Icons.info, context, destination: AboutPage()),
          _drawerItem("Our Faculty", Icons.people, context, destination: FacultyPage()),
          _drawerItem("Placement", Icons.work, context),
          _drawerItem("Feedback Form", Icons.feedback, context, destination: FeedbackForm()),
          _drawerItem("Notification", Icons.notifications, context, destination: NotificationsPage()),
          _drawerItem("Vission & Mission", Icons.notifications, context, destination: VisionMissionPage()),
          _drawerItem("Web View", Icons.link, context, destination: WebViewScreen()),
        ],
      ),
    );
  }

  // Helper function for drawer items
  Widget _drawerItem(String title, IconData icon, BuildContext context, {Widget? destination}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
    );
  }
}
