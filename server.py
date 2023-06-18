from flask import Flask, request
from dotenv import load_dotenv
import openai
import os

app = Flask(__name__)
load_dotenv()
openai.api_key = os.getenv('API_KEY')

@app.route('/minecraft', methods=['POST'])
def post_minecraft_data():

    incoming = request.get_json(force=True)
    
    if incoming is None:
        return {"message": "Bad Request: JSON data expected in request body"}, 400

    message = incoming.get('question', '') + ' Answer in one sentence.'
    
    if message:
        messages = [{"role": "user", "content": message}]
        chat = openai.ChatCompletion.create(
            model="gpt-3.5-turbo", messages=messages
        )
        reply = chat.choices[0].message.content
        return {"message": reply}, 200
    else:
        return {"message": "Bad Request: No question provided in request body"}, 400


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8000, debug=True)