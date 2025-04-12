import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Make back arrow white
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo3.0.png',
                height: 100,
                errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.image, size: 50, color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Bharatiya Vidya Bhavans Sardar Patel Institute of Technology",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Autonomous Institute Affiliated to Mumbai University",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "About Our Institute",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sardar Patel Institute of Technology (SPIT) is one of the premier engineering institutes, known for its academic excellence, industry-oriented programs, and strong alumni network. Established with a vision to impart quality education, SPIT continues to lead in innovation and research-driven learning.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Text(
              "Our Vision",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "To develop globally competent and ethical professionals through excellence in education, research, and innovation.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. Provide high-quality technical education with state-of-the-art infrastructure and facilities.\n\n"
              "2. Foster an environment of research, innovation, and entrepreneurship.\n\n"
              "3. Instill ethical values and leadership qualities to create responsible professionals.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Address: Bhavan's Campus, Munshi Nagar, Andheri West, Mumbai - 400058\n"
              "Phone: +91 22 26707440\n"
              "Email: info@spit.ac.in",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}