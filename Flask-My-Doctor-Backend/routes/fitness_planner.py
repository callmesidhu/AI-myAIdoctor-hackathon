from flask import Blueprint, request, jsonify
import google.generativeai as genai
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Create Blueprint
fitness_planner_bp = Blueprint('fitness_planner', __name__)

# Configure Gemini API using the key from .env
GENAI_API_KEY = os.getenv("GENAI_API_KEY")
genai.configure(api_key=GENAI_API_KEY)

@fitness_planner_bp.route('/api/fitness-planner', methods=['POST'])
def fitness_planner():
    try:
        data = request.get_json()

        # Validate required fields
        required_fields = ["fitness_goals", "gender", "training_method", "workout_type", "strength_level"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"{field} field is required"}), 400

        # Extract input fields
        fitness_goals = data["fitness_goals"]
        gender = data["gender"]
        training_method = data["training_method"]
        workout_type = data["workout_type"]
        strength_level = data["strength_level"]

        # Compose a prompt for the Gemini API
        prompt = (
            f"Create a personalized fitness plan with the following details:\n"
            f"- Fitness Goals: {fitness_goals}\n"
            f"- Gender: {gender}\n"
            f"- Training Method: {training_method}\n"
            f"- Workout Type: {workout_type}\n"
            f"- Strength Level: {strength_level}\n\n"
            "Please provide a detailed plan including exercise recommendations, sets, reps, and any additional guidance."
        )

        # Generate content using the Gemini API
        model = genai.GenerativeModel("gemini-1.5-pro")
        response = model.generate_content(prompt)

        return jsonify({"fitness_plan": response.text})

    except Exception as e:
        return jsonify({"error": str(e)}), 500
