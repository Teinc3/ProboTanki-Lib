from flask import Flask, render_template, request, jsonify, send_from_directory
from flask_socketio import SocketIO
from flask_cors import CORS
import os

app = Flask(__name__, static_folder='resources')
CORS(app)
socketio = SocketIO(app)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/send', methods=['POST'])
def send_message():
    data = request.get_json()
    message = data.get('message')
    if message:
        try:
            socketio.emit('new_message', {'message': message})
        except Exception as e:
            return jsonify({'status': 'error', 'message': str(e)}), 500
    return jsonify({'status': 'success'}), 200


@app.route('/Prelauncher.swf')
def get_pre_launcher():
    return send_from_directory(app.static_folder, 'Prelauncher.swf')


@app.route('/config.xml')
def get_config():
    return send_from_directory(app.static_folder, 'config.xml')


@socketio.on('connect')
def handle_connect():
    print('Client connected')


@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')


if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=6942, allow_unsafe_werkzeug=True)
