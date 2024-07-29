#!/bin/bash

# Define the folder name
folder_name="ibm_cloud_backend"

# Create the folder if it doesn't already exist
if [ ! -d "$folder_name" ]; then
  mkdir $folder_name
  echo "Folder '$folder_name' created for backend connections to IBM Cloud."
else
  echo "Folder '$folder_name' already exists."
fi

# Navigate into the folder
cd $folder_name

# Optionally, initialize a new Python virtual environment for isolation
python3 -m venv venv
echo "Python virtual environment created."

# Activate the virtual environment
source venv/bin/activate

# Install necessary Python packages
pip install flask ibm-watson dotenv flask-cors
echo "Required Python packages installed."

# Create a basic .env file for storing credentials
echo "IBM_CLOUD_API_KEY=your_api_key_here" > .env
echo "URL=your_url_here" >> .env
echo "PROJECT_ID=your_project_id_here" >> .env
echo "Basic .env file created. Please update it with your actual credentials."

# Create a basic Python script for the backend
echo "from flask import Flask, request, jsonify
import os
from dotenv import load_dotenv

load_dotenv()

# Add credentials here
API_KEY = os.getenv('IBM_CLOUD_API_KEY')
URL = os.getenv('URL')
PROJECT_ID = os.getenv('PROJECT_ID')

app = Flask(__name__)
@app.route('/api', methods=['POST'])
def api():
    data = request.get_json()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='localhost', port=5000)" > app.py

# Reminder to deactivate the virtual environment
echo "Setup complete. Remember to deactivate the virtual environment when done using 'deactivate'."