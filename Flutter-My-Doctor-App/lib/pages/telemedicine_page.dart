
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelemedicinePage extends StatelessWidget {
  const TelemedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Telemedicine\n',
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
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Integration',
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
                ],
              ),
            )
        ),
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
                        Color.fromRGBO(100, 149, 237, 0.9),
                        Color.fromRGBO(211, 211, 211, 0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
    Center(
    child: Text(
    'Coming Soon...',
    style: GoogleFonts.robotoSlab(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
    Shadow(
    color: Colors.black,
    offset: Offset(2, 2),
    blurRadius: 4,
    ),
            ]
        )
    )
    )
    ]
        )
    );
  }
}
    // Form Content
