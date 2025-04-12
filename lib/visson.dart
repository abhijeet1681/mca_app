import 'package:flutter/material.dart';

class VisionMissionPage extends StatelessWidget {
  const VisionMissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Page Heading
              Text(
                "Department Vision & Mission",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Expandable Cards for Vision and Mission
              _buildExpandableSectionCard(
                title: "DEPARTMENT VISION (Effective from 2024-25)",
                content:
                "To develop globally competent and ethical professionals in Computer Science and Engineering and enable them to contribute to society.",
              ),
              _buildExpandableSectionCard(
                title: "DEPARTMENT VISION",
                content:
                "To create a center of excellence which will produce cutting edge technologies to cater needs of Business and Society.",
              ),
              _buildExpandableSectionCard(
                title: "DEPARTMENT MISSION (Effective from 2024-25)",
                content:
                "M1: To provide rigorous, high-standard, multidisciplinary curriculum and innovative T-L-E-A processes and ensure a stimulating academic environment.\n\n"
                    "M2: To promote research and innovations through collaborations.\n\n"
                    "M3: To develop requisite attitudes and skills, besides providing a strong knowledge foundation.\n\n"
                    "M4: To foster ethics and social responsibility among stakeholders and imbibe a sense of contribution.",
              ),
              _buildExpandableSectionCard(
                title: "DEPARTMENT MISSION",
                content:
                "1. To provide high quality education.\n\n"
                    "2. To train the students to excel in cutting edge technologies that makes them industry ready.\n\n"
                    "3. To inculcate ethical and professional values in students for betterment of society.\n\n"
                    "4. To inculcate Entrepreneurial mindset in students to make them job creators.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build an expandable card for each section
  Widget _buildExpandableSectionCard({
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 4, 14, 74),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 13, height: 1.4),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}