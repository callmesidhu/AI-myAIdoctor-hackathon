

import 'package:flutter/material.dart';
import 'package:flutter_my_doctor_app/pages/riskprediction_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'diagnosis_page.dart';
import 'alert_page.dart';
import 'chat_page.dart';
import 'telemedicine_page.dart';
import 'fitness_page.dart';
class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.local_hospital, 'label': 'AI Powered Health Diagnosis'},
    {'icon': Icons.sick, 'label': 'Disease Risk Prediction'},
    {
      'icon': Icons.health_and_safety,
      'label': 'Health Alerts and Notifications'
    },
    {'icon': Icons.smart_toy, 'label': 'AI Chatbot'},
    {'icon': Icons.sports_gymnastics, 'label': 'Workout Planner'},
    {'icon': Icons.emergency, 'label': 'Telemedicine Integration'},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(100, 149, 237, 0.85),
                    Color.fromRGBO(211, 211, 211, 0.85),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Choose',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  Expanded(
                    child: GridView.builder(
                      itemCount: options.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 50,
                      ),
                      itemBuilder: (context, index) {
                        final item = options[index];
                        return GestureDetector(
                          onTap: () {
                            if (item['label'] == 'AI Powered Health Diagnosis') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DiagnosisPage()),
                              );
                            }
                            if (item['label'] == 'Disease Risk Prediction') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RiskPredictionPage()),
                              );
                            }
                            if (item['label'] == 'Health Alerts and Notifications') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AlertPage()),
                              );
                            }
                            if (item['label'] == 'AI Chatbot') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatPage()),
                              );
                            }
                            if (item['label'] == 'Workout Planner') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FitnessPage()),
                              );
                            }
                            if (item['label'] == 'Telemedicine Integration') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TelemedicinePage()),
                              );
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.blue[800],
                                child: Icon(
                                  item['icon'],
                                  size: 36,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item['label'],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey[900],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


