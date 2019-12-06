#!/usr/bin/python3

# Import database module.
from firebase_admin import credentials, firestore, initialize_app, db
import datetime
from CarEvent import CarEvent

cred = credentials.Certificate('pumpkin-pi-firebase-admin-key.json')
default_app = initialize_app(cred)
db = firestore.client()
cameraData = db.collection("cameraData")
carEvents = db.collection("carEvents")
realTime = cameraData.document("realTime")

def carEntryEvent():
    currentCount = realTime.get()
    tempCount = currentCount.to_dict()['currentCount']
    tempCount += 1
    realTime.set({"currentCount": tempCount})

    car_event = CarEvent(isEntry=True)
    carEvents.document().set(car_event.to_dict())


if __name__ == '__main__':
    carEntryEvent()
