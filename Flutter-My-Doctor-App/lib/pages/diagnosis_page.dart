
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiagnosisPage extends StatefulWidget {
  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  final _formKey = GlobalKey<FormState>();
  String symptoms = '';

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
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 27, horizontal: 12),
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
                      hintText: 'e.g. asthma,diabetes,high BP',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 27, horizontal: 12),
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
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 27, horizontal: 12),
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

                  SizedBox(height: 50),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Analyzing symptoms...')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      ),
                      child: Text('Analyze with AI',
                          style: GoogleFonts.poppins(
                            color: Colors.white
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
                ),
    ]
      ),
    );
  }
}
