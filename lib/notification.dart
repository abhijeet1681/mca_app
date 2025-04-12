import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final Map<String, List<String>> notifications = {
    'University Notices': [
      'New academic calendar released for 2025.',
      'University closed on March 15 for maintenance.',
    ],
    'Exam Notices': [
      'MCA Semester 2 exams start from April 10.',
      'Last date to fill exam form: March 25.',
    ],
    'Upcoming Events': [
      'Tech Fest 2025: April 5-7.',
      'Guest lecture on AI: March 20 at 10 AM.',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow to white
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: notifications.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(entry.key, entry.value, context),
                SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> notices, BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: notices
                  .map((notice) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationDetailPage(detail: notice),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.notifications, color: Colors.black, size: 18),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  notice,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final String detail;

  NotificationDetailPage({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Detail", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow to white
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            detail,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotificationsPage(),
  ));
}
