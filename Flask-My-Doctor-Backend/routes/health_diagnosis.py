from flask import Blueprint, request, jsonify
import google.generativeai as genai
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Create Blueprint
health_diagnosis_bp = Blueprint('health_diagnosis', __name__)

# Configure Gemini API using the key from .env
GENAI_API_KEY = os.getenv("GENAI_API_KEY")
genai.configure(api_key=GENAI_API_KEY)

@health_diagnosis_bp.route('/api/health-diagnosis', methods=['POST'])
def health_diagnosis():
    try:
        data = request.get_json()

        # Validate required fields
        required_fields = ["symptoms", "medical_condition", "symptom_duration"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"{field} field is required"}), 400

        # Extract input fields
        symptoms = data["symptoms"]
        medical_condition = data["medical_condition"]
        symptom_duration = data["symptom_duration"]

        # Compose a prompt for the Gemini API
        prompt = (
            f"Based on the following details, provide a preliminary health diagnosis along with "
            f"recommended next steps and precautions (note: this is not a substitute for professional medical advice):\n"
            f"- Symptoms: {symptoms}\n"
            f"- Medical Condition: {medical_condition}\n"
            f"- Symptom Duration: {symptom_duration}\n"
        )

        # Generate content using the Gemini API
        model = genai.GenerativeModel("gemini-1.5-pro")
        response = model.generate_content(prompt)

        return jsonify({"diagnosis": response.text})
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500
