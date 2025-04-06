import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';

class RiskPredictionPage extends StatefulWidget {
  const RiskPredictionPage({Key? key}) : super(key: key);

  @override
  _RiskPredictionPageState createState() => _RiskPredictionPageState();
}

class _RiskPredictionPageState extends State<RiskPredictionPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each input field
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController bloodSugarController = TextEditingController();
  final TextEditingController cholesterolController = TextEditingController();
  final TextEditingController familyHistoryController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    bloodPressureController.dispose();
    bloodSugarController.dispose();
    cholesterolController.dispose();
    familyHistoryController.dispose();
    super.dispose();
  }

  // Function to make the POST request and show the result
  Future<void> _predictRisk() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('http://10.0.2.2:5000/api/risk-predictor');
      final payload = {
        "age": int.tryParse(ageController.text) ?? 0,
        "blood_pressure": bloodPressureController.text,
        "blood_sugar": int.tryParse(bloodSugarController.text) ?? 0,
        "cholestrol_level": int.tryParse(cholesterolController.text) ?? 0,
        "family_history": familyHistoryController.text,
      };

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final prediction = data['risk_prediction'];

          // Show prediction result in a dialog
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Risk Prediction'),
              content: SingleChildScrollView(
                child: MarkdownBody(data: prediction),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                )
              ],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${response.statusCode}')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      }
    }
  }

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
                        buildTextField(controller: ageController, hintText: 'e.g., 45'),
                        buildLabel('Enter your Blood Pressure'),
                        buildTextField(controller: bloodPressureController, hintText: 'e.g., 130/85'),
                        buildLabel('Enter your Blood Sugar'),
                        buildTextField(controller: bloodSugarController, hintText: 'e.g., 110'),
                        buildLabel('Enter your Cholesterol Level'),
                        buildTextField(controller: cholesterolController, hintText: 'e.g., 200'),
                        buildLabel('Enter your family history'),
                        buildTextField(controller: familyHistoryController, hintText: 'Yes or No'),
                        SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: _predictRisk,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build a text label
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

  // Widget to build a text field with validation
  Widget buildTextField({required TextEditingController controller, String? hintText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }
}
