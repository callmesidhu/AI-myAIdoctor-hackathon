from flask import Blueprint, request, jsonify
import google.generativeai as genai
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Create Blueprint
risk_predictor_bp = Blueprint('risk_predictor', __name__)

# Configure Gemini API using the key from .env
GENAI_API_KEY = os.getenv("GENAI_API_KEY")
genai.configure(api_key=GENAI_API_KEY)

@risk_predictor_bp.route('/api/risk-predictor', methods=['POST'])
def risk_predictor():
    try:
        data = request.get_json()

        # Validate required fields
        required_fields = ["age", "blood_pressure", "blood_sugar", "cholestrol_level", "family_history"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"{field} field is required"}), 400

        # Extract input fields
        age = data["age"]
        blood_pressure = data["blood_pressure"]
        blood_sugar = data["blood_sugar"]
        cholestrol_level = data["cholestrol_level"]
        family_history = data["family_history"]

        # Compose a prompt for the Gemini API
        prompt = (
            f"Based on the following patient details, predict the risk of developing diseases:\n"
            f"- Age: {age}\n"
            f"- Blood Pressure: {blood_pressure}\n"
            f"- Blood Sugar: {blood_sugar}\n"
            f"- Cholestrol Level: {cholestrol_level}\n"
            f"- Family History: {family_history}\n\n"
            "Provide a detailed analysis including potential risk factors, recommendations for lifestyle changes, and suggestions for further tests."
        )

        # Generate content using the Gemini API
        model = genai.GenerativeModel("gemini-1.5-pro")
        response = model.generate_content(prompt)

        return jsonify({"risk_prediction": response.text})
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500
