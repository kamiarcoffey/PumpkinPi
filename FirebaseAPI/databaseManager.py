#!/usr/bin/python3

# Import database module.
from firebase_admin import credentials, firestore, initialize_app, db
import datetime


cred = credentials.Certificate('pumpkin-pi-firebase-admin-key.json')
default_app = initialize_app(cred)
db = firestore.client()
cameraData = db.collection("cameraData")
carEvents = db.collection("carEvents")
realTime = cameraData.document("realTime")

class CarEvent(object):
    def __init__(self, isEntry):
        self.isEntry = isEntry
        self.time_stamp = datetime.datetime.now()

    def to_dict(self):
        dest = {
            u'isEntry': self.isEntry,
            u'timeStamp': self.time_stamp,
        }
        return dest

def carEntryEvent():
    currentCount = realTime.get()
    tempCount = currentCount.to_dict()['currentCount']
    tempCount += 1
    realTime.set({"currentCount": tempCount})

    car_event = CarEvent(isEntry=True)
    carEvents.document().set(car_event.to_dict())

def carExitEvent():
    currentCount = realTime.get()
    tempCount = currentCount.to_dict()['currentCount']
    tempCount -= 1
    realTime.set({"currentCount": tempCount})

    car_event = CarEvent(isEntry=False)
    carEvents.document().set(car_event.to_dict())


if __name__ == '__main__':
    carEntryEvent()
    # carExitEvent()



# Depricated
# class FirebaseDB():
#     def __init__(self, cred):
#         self.default_app = initialize_app(cred)
#         self.db = firestore.client()
#         self.cameraData = db.collection("cameraData")
#         self.carEvents = db.collection("carEvents")
#         self.realTime = cameraData.document("realTime")
