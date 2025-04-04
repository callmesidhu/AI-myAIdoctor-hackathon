import 'package:flutter/material.dart';
import 'package:flutter_my_doctor_app/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthService _authService = AuthService(); // Create an instance of AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromRGBO(100, 149, 237, 0.7),
                    const Color.fromRGBO(211, 211, 211, 0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo image
                    Image.asset(
                      'assets/images/bg.png',
                      height: 140,
                    ),
                    const SizedBox(height: 20),
                    // App title
                    Text(
                      'my AI doctor',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                        shadows: const [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Login with Google Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        elevation: 2,
                      ),
                      onPressed: () async {
                        try {
                          // Call the Google Sign-In function from AuthService
                          var user = await _authService.signInWithGoogle();
                          if (user != null) {
                            // On successful sign-in, navigate to HomePage
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else {
                            // Handle user cancellation or error
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sign-in failed')),
                            );
                          }
                        } catch (error) {
                          // Display error message
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sign-in error: $error")),
                          );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/download.png',
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          const Text(
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
      ),
    );
  }
}
