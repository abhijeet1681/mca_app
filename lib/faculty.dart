import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainNavigationPage(),
  ));
}

// -------------------- Main Navigation Page --------------------

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page')), // Replace with your actual Home widget
    Center(child: Text('About Page')),
    FacultyPage(),
    Center(child: Text('Vision & Mission Page')),
    Center(child: Text('Notifications Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

// -------------------- Faculty Page --------------------

class FacultyPage extends StatelessWidget {
  final List<Faculty> facultyList = [
    Faculty(
      name: "Prof Harshil Kanakia",
      designation: "Asst. Professor",
      contact: "harshil_kanakia@spit.ac.in",
      image: "assets/images/harshil_sir.png",
      profileUrl: "https://mca.spit.ac.in/index.php/prof-harshil-kanakia/",
    ),
    Faculty(
      name: "Prof. Sakina Shaikh",
      designation: "Asst. Professor",
      contact: "sakina_shaikh@spit.ac.in",
      image: "assets/images/sakina_mam.png",
      profileUrl: "https://mca.spit.ac.in/index.php/sakina-salmani/",
    ),
    Faculty(
      name: "Prof. Aarti Karande",
      designation: "Asst. Professor",
      contact: "aarti_karande@spit.ac.in",
      image: "assets/images/Aarti_mam.png",
      profileUrl: "https://mca.spit.ac.in/index.php/aarti-karande/",
    ),
    Faculty(
      name: "Dr. Nikhita Mangaonkar",
      designation: "Asst. Professor",
      contact: "nikhita_mangaonkar@spit.ac.in",
      image: "assets/images/nikhita_mam.jpg",
      profileUrl: "https://mca.spit.ac.in/index.php/nikhita-mangaonkar/",
    ),
    Faculty(
      name: "Dr. Pallavi Thakur",
      designation: "Asst. Professor",
      contact: "pallavi_thakur@spit.ac.in",
      image: "assets/images/pallavi_mam.png",
      profileUrl: "https://mca.spit.ac.in/index.php/pallavi-thakur/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Faculty', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: facultyList.length,
          itemBuilder: (context, index) {
            return FacultyCard(faculty: facultyList[index]);
          },
        ),
      ),
    );
  }
}

// -------------------- Faculty Model --------------------

class Faculty {
  final String name;
  final String designation;
  final String contact;
  final String image;
  final String profileUrl;

  Faculty({
    required this.name,
    required this.designation,
    required this.contact,
    required this.image,
    required this.profileUrl,
  });
}

// -------------------- Faculty Card --------------------

class FacultyCard extends StatefulWidget {
  final Faculty faculty;

  FacultyCard({required this.faculty});

  @override
  _FacultyCardState createState() => _FacultyCardState();
}

class _FacultyCardState extends State<FacultyCard> {
  bool _isExpanded = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(widget.faculty.image),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.faculty.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                    Text(
                      widget.faculty.designation,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.orange.shade800,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact: ${widget.faculty.contact}",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () => _launchURL(widget.faculty.profileUrl),
                    child: Center(
                      child: Text(
                        "View Profile",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
