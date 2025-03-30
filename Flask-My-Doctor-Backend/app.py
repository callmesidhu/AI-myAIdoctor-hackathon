from flask import Flask
from routes.chatbot import chatbot_bp

app = Flask(__name__)

app.register_blueprint(chatbot_bp)


@app.route('/')
def home():
    return '<div style="display: flex; justify-content: center; align-items: center; height: 100vh; background-color: cyan;">' \
           '<h1>Welcome to the myAIdoctor API!</h1>' \
           '</div>'

if __name__ == '__main__':
    app.run(debug=True)
