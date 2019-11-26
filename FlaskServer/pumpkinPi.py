# app.py
# from tutorial https://medium.com/google-cloud/building-a-flask-python-crud-api-with-cloud-firestore-firebase-and-deploying-on-cloud-run-29a10c502877





import os
import firebase_admin
import flask

# specific ones too for ease
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app, db

# Boilerplate initializaiton
app = Flask(__name__)

# this file is .gitignored so you have to get it from kamiar.coffey@gmail.com
cred = credentials.Certificate('pumpkin-pi-firebase-admin-key.json')
default_app = initialize_app(cred)
db = firestore.client()
cameraData_ref = db.collection("cameraData")
realTime_ref = cameraData_ref.document("realTime")

@app.route('/add', methods=['POST'])
def create():

    fb = firebase.FirebaseApplication('https://myAssignedDomain.com/', None)
    fb.put('test/asdf',"count",4) #"path","property_Name",property_Value

    req = flask.request.json
    hero = SUPERHEROES.push(req)
    return flask.jsonify({'id': hero.key}), 201

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
    app.create()
