import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiskPredictionPage extends StatefulWidget {
  const RiskPredictionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RiskPredictionPageState createState() => _RiskPredictionPageState();
}

class _RiskPredictionPageState extends State<RiskPredictionPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Disease Risk Prediction',
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
          // Form Content
          SingleChildScrollView(
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: MediaQuery.of(context).size.height,
    ),
    child: IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, kToolbarHeight + 24, 16, 32),
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabel('Enter your age'),
                    buildTextField(),
                    buildLabel('Enter your Blood Pressure'),
                    buildTextField(),
                    buildLabel('Enter your Blood Sugar'),
                    buildTextField(),
                    buildLabel('Enter your Cholesterol Level'),
                    buildTextField(),
                    buildLabel('Enter your family history'),
                    buildTextField(),
                    SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                        ),
                        child: Text(
                          'Predict Risk',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    )
    ),
    ],
      ),
    );
  }

  Widget buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 15),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildTextField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
