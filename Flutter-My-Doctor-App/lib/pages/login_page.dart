import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
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
    Color.fromRGBO(100, 149, 237, 0.7), // for a custom blue tone
    Color.fromRGBO(211, 211, 211, 0.7), // for a light grey
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    ),
    ),

      SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bg.png',
                  height: 140,
                ),

                SizedBox(height: 20),

                Text(
                  'my AI doctor',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                    shadows: [
                      Shadow(
                        color:Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      )
                    ]
                  ),
                ),

                SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    elevation: 2,
                  ),
                  onPressed: () {
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/download.png',
                        height: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ],
      )
    );
  }
}
