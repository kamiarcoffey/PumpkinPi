# app.py
# from tutorial https://medium.com/google-cloud/building-a-flask-python-crud-api-with-cloud-firestore-firebase-and-deploying-on-cloud-run-29a10c502877

import os
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app

# Boilerplate initializaiton
app = Flask(__name__)

# this file is .gitignored so you have to get it from kamiar.coffey@gmail.com
_credentials_ = credentials.Certificate('key.json')
default_app = initialize_app(_credentials_)
db = firestore.client()
cameraData_ref = db.collection("cameraData")
realTime_ref = cameraData_ref.document("realTime")

@app.route('/add', methods=['POST'])
def create():
    """
        create() : Add document to Firestore collection with request body
        Ensure you pass a custom ID as part of json body in post request
        e.g. json={'id': '1', 'title': 'Write a blog post'}
    """
    try: id = request.json['id']
        realTime_ref.setValue(0, forKey: "currentCount")
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occured: {e}"

@app.route('/update', methods=['POST', 'PUT'])
def update():
    try:
        id = request.json['id']
        realTime_ref.update(request.json)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occured: {e}"

port = int(os.environ.get('PORT', 8080))

if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=port)
