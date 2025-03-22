
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.local_hospital, 'label': 'AI Powered Health Diagnosis'},
    {'icon': Icons.sick, 'label': 'Disease Risk Prediction'},
    {
      'icon': Icons.health_and_safety,
      'label': 'Health Alerts and Notification'
    },
    {'icon': Icons.smart_toy, 'label': 'AI Chat'},
    {'icon': Icons.sports_gymnastics, 'label': 'Fitness Planner'},
    {'icon': Icons.emergency, 'label': 'Telemedicine Integration'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      // Background Image
      Positioned.fill(
      child: Image.asset(
        'assets/images/bg.jpg',
        fit: BoxFit.cover,
      ),
    ),

    // Gradient Overlay
    Positioned.fill(
    child: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Color.fromRGBO(100, 149, 237, 0.8), // for a custom blue tone
    Color.fromRGBO(211, 211, 211, 0.8), // for a light grey
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
              // Title
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Grid
              Expanded(
                child: GridView.builder(
                  itemCount: options.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 50,
                  ),
                  itemBuilder: (context, index) {
                    final item = options[index];
                    return Column(
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
  ],
    )
    );
  }
}

