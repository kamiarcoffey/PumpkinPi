# Import database module.
from firebase_admin import credentials, firestore, initialize_app, db
import datetime

class FirebaseDB(object):
    def __init__(self):
    self.cred = credentials.Certificate('pumpkin-pi-firebase-admin-key.json')
    self.default_app = initialize_app(cred)
    self.db = firestore.client()
    self.cameraData = db.collection("cameraData")
    self.carEvents = db.collection("carEvents")
    self.realTime = cameraData.document("realTime")
