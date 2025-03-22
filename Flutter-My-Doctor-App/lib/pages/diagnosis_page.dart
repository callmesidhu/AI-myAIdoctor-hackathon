import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiagnosisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'AI Health Diagnosis',
          style: GoogleFonts.robotoSlab(
            fontSize: 26,
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
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
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
                    Color.fromRGBO(100, 149, 237, 0.9), // custom blue tone
                    Color.fromRGBO(211, 211, 211, 0.9), // light grey
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Page Content

        ],
      ),
    );
  }
}
