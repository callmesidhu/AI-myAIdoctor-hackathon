import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  final _formKey = GlobalKey<FormState>();

  String symptoms = '';
  String conditions = '';
  String duration = '';
  String analysisResult = '';

  // Function to make the POST request to the health diagnosis API
  Future<void> _analyzeHealth() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('http://10.0.2.2:5000/api/health-diagnosis');
      final payload = {
        "symptoms": symptoms,
        "medical_condition": conditions,
        "symptom_duration": duration,
      };

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          setState(() {
            analysisResult = data['diagnosis'];
          });
        } else {
          setState(() {
            analysisResult = 'Error: ${response.statusCode} - Unable to fetch diagnosis.';
          });
        }
      } catch (error) {
        setState(() {
          analysisResult = 'Error: $error';
        });
      }
    }
  }

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
                    Color.fromRGBO(100, 149, 237, 0.9),
                    Color.fromRGBO(211, 211, 211, 0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Form Content
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, kToolbarHeight + 24, 16, 32),
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Symptoms Input
                    Text(
                      'Enter your symptoms',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'e.g. fever, cough, headache',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 27, horizontal: 12),
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        setState(() {
                          symptoms = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your symptoms';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    // Medical Conditions Input
                    Text(
                      'Enter existing medical conditions',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'e.g. asthma, diabetes, high BP',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 27, horizontal: 12),
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        setState(() {
                          conditions = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your conditions';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    // Duration Input
                    Text(
                      'Enter the duration of symptoms',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'e.g. 2 days, 1 week',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 27, horizontal: 12),
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        setState(() {
                          duration = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the duration';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    // Analyze Button
                    Center(
                      child: ElevatedButton(
                        onPressed: _analyzeHealth,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        ),
                        child: Text(
                          'Analyze with AI',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Display the Diagnosis Result
                    if (analysisResult.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          analysisResult,
                          style: GoogleFonts.poppins(fontSize: 16),
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
