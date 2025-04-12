import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_clg/faculty.dart';
import 'side_nav.dart';
import 'about.dart'; // Import About Page
import 'visson.dart';
import 'notification.dart'; // Import Notifications Page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Default index for Home

  final List<Widget> _pages = [
    HomePageContent(), // Home Page Content
    AboutPage(),
    FacultyPage(),
    VisionMissionPage(),
    NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideNav(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo3.0.png',
                height: 40,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, color: Color.fromARGB(255, 214, 10, 10)),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bharatiya Vidya Bhavans",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Sardar Patel Institute of Technology",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Autonomous Institute Affiliated to Mumbai University",
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "Faculty"),
            BottomNavigationBarItem(icon: Icon(Icons.visibility), label: "Vision & Mission"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          ],
        ),
      ),
    );
  }
}
// Separate Home Page Content
class HomePageContent extends StatelessWidget {
  final List<String> achievementImages = [
    'assets/images/st1.png',
    'assets/images/st2.jpg',
    'assets/images/st4.0.jpg',
    'assets/images/st4.00.jpg',
    'assets/images/st5.0.jpg',
    'assets/images/st6.0.png',
    'assets/images/st7.0.png',
    'assets/images/st8.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: const Text(
              'Student Achievements',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
            ),
            items: achievementImages.map((imagePath) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: const Text(
              'Vision & Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const VisionMissionCard(),
        ],
      ),
    );
  }
}

class VisionMissionCard extends StatefulWidget {
  const VisionMissionCard({super.key});

  @override
  _VisionMissionCardState createState() => _VisionMissionCardState();
}

class _VisionMissionCardState extends State<VisionMissionCard> {
  bool _isVisionExpanded = false;
  bool _isMissionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildExpandableSection(
            title: "Vision",
            content: "To develop globally competent and ethical professionals...",
            isExpanded: _isVisionExpanded,
            onTap: () => setState(() => _isVisionExpanded = !_isVisionExpanded),
          ),
          const SizedBox(height: 10),
          _buildExpandableSection(
            title: "Mission",
            content: "We strive to create an environment for growth...",
            isExpanded: _isMissionExpanded,
            onTap: () => setState(() => _isMissionExpanded = !_isMissionExpanded),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange.shade800),
              ),
              Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.orange.shade800),
            ],
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(content, style: const TextStyle(fontSize: 16, color: Colors.black87)),
          ),
      ],
    );
  }
}
