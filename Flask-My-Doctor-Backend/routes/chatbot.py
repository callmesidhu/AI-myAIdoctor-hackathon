from flask import Blueprint, request, jsonify
import google.generativeai as genai
import os
from dotenv import load_dotenv


# Load environment variables
load_dotenv()

# Create Blueprint
chatbot_bp = Blueprint('chatbot', __name__)

# Configure Gemini API
GENAI_API_KEY = os.getenv("GENAI_API_KEY")
genai.configure(api_key=GENAI_API_KEY)

@chatbot_bp.route('/api/chat-bot', methods=['POST'])
def chat_bot():
    try:
        data = request.get_json()

        if not data or "message" not in data:
            return jsonify({"error": "Message field is required"}), 400
        
        user_message = data["message"]
        model = genai.GenerativeModel("gemini-1.5-pro")
        response = model.generate_content(user_message)
        return jsonify({"response": response.text})

    except Exception as e:
        return jsonify({"error": str(e)}), 500
