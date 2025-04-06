import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';


class FitnessGoalForm extends StatefulWidget {
  @override
  _FitnessGoalFormState createState() => _FitnessGoalFormState();
}

class _FitnessGoalFormState extends State<FitnessGoalForm> {
  final _formKey = GlobalKey<FormState>();

  String? fitnessGoal = 'Gain Weight';
  String? gender = 'Male';
  String? trainingMethod = 'Resistance + cardio';
  String? workoutType = 'Bodyweight';
  String? strengthLevel = 'Beginner';

  final List<String> fitnessGoals = ['Gain Weight', 'Lose Weight', 'Maintain'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> trainingMethods = ['Resistance', 'Cardio', 'Resistance + cardio'];
  final List<String> workoutTypes = ['Bodyweight', 'Gym', 'Home Equipment'];
  final List<String> strengthLevels = ['Beginner', 'Intermediate', 'Advanced'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Workout Planner',
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
                    Color.fromRGBO(100, 149, 237, 0.85), // CornflowerBlue
                    Color.fromRGBO(211, 211, 211, 0.9),  // LightGray
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Form content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildDropdown("What are your fitness goals?", fitnessGoals, fitnessGoal, (value) {
                              setState(() => fitnessGoal = value);
                            }),
                            _buildDropdown("Gender", genders, gender, (value) {
                              setState(() => gender = value);
                            }),
                            _buildDropdown("Training method", trainingMethods, trainingMethod, (value) {
                              setState(() => trainingMethod = value);
                            }),
                            _buildDropdown("Workout type", workoutTypes, workoutType, (value) {
                              setState(() => workoutType = value);
                            }),
                            _buildDropdown("Strength level", strengthLevels, strengthLevel, (value) {
                              setState(() => strengthLevel = value);
                            }),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _submitForm,
                              child: Text("Submit"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      );
  }

  Widget _buildDropdown(String label, List<String> items, String? value, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 5),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(),
            ),
            value: value,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> requestBody = {
        "fitness_goals": fitnessGoal,
        "gender": gender,
        "training_method": trainingMethod,
        "workout_type": workoutType,
        "strength_level": strengthLevel,
      };

      try {
        final response = await http.post(
          Uri.parse("http://10.0.2.2:5000/api/workout-planner"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(requestBody),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final String plan = responseData['fitness_plan'];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutPlanPage(plan: plan),
            ),
          );
        } else {
          _showError("Failed to generate plan. Try again later.");
        }
      } catch (e) {
        _showError("Error occurred: $e");
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class WorkoutPlanPage extends StatelessWidget {
  final String plan;

  const WorkoutPlanPage({Key? key, required this.plan}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Workout Plan"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to Fitness Planner page
            },
          ),
        ),
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
    Color.fromRGBO(100, 149, 237, 0.85),
    Color.fromRGBO(211, 211, 211, 0.85),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    ),
    ),

    // Your main content
    SafeArea(
    child:SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
          child: Text(plan, style: TextStyle(fontSize: 16)),
        ),
      ),
    ]
      )
    );
  }
}
