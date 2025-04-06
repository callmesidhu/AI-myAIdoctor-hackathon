
import 'package:flutter/material.dart';

class FitnessPage extends StatefulWidget {
  @override
  _FitnessFormPageState createState() => _FitnessFormPageState();
}

class _FitnessFormPageState extends State<FitnessPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController goalController = TextEditingController();

  String? selectedGender;
  String? selectedTraining;
  String? selectedWorkout;
  String? selectedStrength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Fitness Setup"),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, kToolbarHeight + 24, 16.0, 16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: goalController,
                      decoration: InputDecoration(
                        labelText: "What are your fitness goals?",
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 16),

                    _buildDropdown(
                      label: "Gender",
                      value: selectedGender,
                      items: ["Male", "Female", "Other"],
                      onChanged: (val) => setState(() => selectedGender = val),
                    ),
                    _buildDropdown(
                      label: "Training method",
                      value: selectedTraining,
                      items: ["Resistance", "Cardio", "Resistance + cardio"],
                      onChanged: (val) => setState(() => selectedTraining = val),
                    ),
                    _buildDropdown(
                      label: "Workout type",
                      value: selectedWorkout,
                      items: ["Bodyweight", "Dumbbell", "Gym Equipment"],
                      onChanged: (val) => setState(() => selectedWorkout = val),
                    ),
                    _buildDropdown(
                      label: "Strength level",
                      value: selectedStrength,
                      items: ["Beginner", "Intermediate", "Advanced"],
                      onChanged: (val) => setState(() => selectedStrength = val),
                    ),

                    SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Goal: ${goalController.text}");
                          print("Gender: $selectedGender");
                          print("Training: $selectedTraining");
                          print("Workout: $selectedWorkout");
                          print("Strength: $selectedStrength");
                        }
                      },
                      child: Text("Submit"),
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

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white70,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

