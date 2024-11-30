import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HealthTipPage extends StatefulWidget {
  @override
  _HealthTipPageState createState() => _HealthTipPageState();
}

class _HealthTipPageState extends State<HealthTipPage> {
  final List<String> tips = [
    "Stay hydrated by drinking at least 8-10 glasses of water daily.",
    "Eat a balanced diet rich in vitamins and minerals for both you and your baby.",
    "Take prenatal vitamins as prescribed by your doctor, especially folic acid.",
    "Get regular, light exercise to stay fit and healthy throughout your pregnancy.",
    "Avoid caffeine and limit consumption of coffee, tea, and soft drinks.",
    "Get plenty of rest and sleep, especially as your pregnancy progresses.",
    "Attend all your prenatal checkups to monitor both your and your baby’s health.",
    "Avoid raw or undercooked foods to reduce the risk of infections.",
    "Stay away from alcohol and smoking as they can harm your baby’s development.",
    "Eat small, frequent meals to avoid nausea and heartburn.",
    "Wear comfortable clothing and supportive shoes to avoid swelling and discomfort.",
    "Practice good posture to prevent back pain as your belly grows.",
    "Take care of your mental health by practicing relaxation techniques like meditation or yoga.",
    "Stay away from second-hand smoke and other harmful chemicals.",
    "Stay informed about your baby's development through each trimester.",
    "Educate yourself about childbirth options and make a birth plan.",
    "Use a pregnancy pillow to support your growing belly and back while sleeping.",
    "Avoid heavy lifting or strenuous activities that could strain your body.",
    "Talk to your doctor about any concerns you have, whether physical or emotional.",
    "Pamper yourself with safe skincare products to prevent stretch marks and skin dryness.",
    "Enroll in childbirth or parenting classes to prepare yourself for labor and parenting.",
    "Monitor your baby’s movements daily during the third trimester.",
    "Avoid hot baths or saunas as they can raise your body temperature too much.",
    "Wear sunscreen and protect your skin as pregnancy can make it more sensitive to sun exposure.",
    "Manage stress through light activities like reading, walking, or listening to music.",
    "Prepare for breastfeeding by learning techniques and discussing it with your doctor.",
    "Always wear a seatbelt, with the strap placed under your belly for safety.",
    "Eat foods high in fiber to avoid constipation, a common pregnancy issue.",
    "Ensure you’re gaining a healthy amount of weight by following your doctor’s advice.",
    "Keep your blood sugar levels balanced by eating small, healthy snacks throughout the day."
  ];

  String getTipForToday() {
    // Get the current day of the year (from 1 to 365)
    int dayOfYear = int.parse(DateFormat("D").format(DateTime.now()));
    // Use modulus to cycle through tips
    int tipIndex = dayOfYear % tips.length;
    return tips[tipIndex];
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic texts
    String mainMessage = "Daily Tips";
    String currentTip = getTipForToday();
    String pcodDefinition = "PCOD: It is a disease in which many small cysts develop in the ovary due to hormonal problems.";

    return Scaffold(
      appBar: AppBar(
        title: Text('Pregnancy Tips'),
        backgroundColor: Colors.purple[200], // Light purple app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            // Main message text
            Center(
              child: Text(
                mainMessage,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            // Thought Box (slightly different background color)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[50], // Light purple background for container
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: null, // Replace with actual image asset
                        radius: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Expert tip by Dr. Sumaiya',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.verified, color: Colors.blue),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Expert thought text (Dynamic daily tip)
                  Text(
                    currentTip,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),

                  // PCOD Definition
                  Text(
                    pcodDefinition,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // White background for the page
    );
  }
}
