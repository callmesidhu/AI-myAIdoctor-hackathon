import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(500) ,
        child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(
        TextSpan(
        children: [
        TextSpan(
        text: 'Health Alerts and\n',
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
    WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: Padding(
    padding: const EdgeInsets.only(top: 0.20), // Move it lower
    child: Text(
    'Notifications',
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
      textAlign: TextAlign.center,
    ),
    ),
    ),
    ],
    ),
    ),
      ),
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