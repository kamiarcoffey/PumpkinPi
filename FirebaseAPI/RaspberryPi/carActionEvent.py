
#!/usr/bin/python3

# Import database module.
#import firebase_admin
from firebase_admin import credentials, firestore, initialize_app, db
import datetime
from CarEvent import CarEvent

cred = credentials.Certificate('pumpkin-pi-firebase-admin-key.json')
default_app = initialize_app(cred)
db = firestore.client()
cameraData = db.collection("cameraData")
carEvents = db.collection("carEvents")
realTime = cameraData.document("realTime")

def carEntryEvent(): #adds one to database count for entry
    currentCount = realTime.get()
    tempCount = currentCount.to_dict()['currentCount']
    tempCount += 1
    print("car entering garage...")
    
    realTime.set({"currentCount": tempCount})
    car_event = CarEvent(isEntry=True)
    carEvents.document().set(car_event.to_dict())

def carExitEvent(): #subtracts one from databse count for exit
    currentCount = realTime.get()
    tempCount = currentCount.to_dict()['currentCount']
    if tempCount > 0: #car only exits if there are cars to exit garage
        tempCount -= 1
        print("car exiting garage...")

    realTime.set({"currentCount": tempCount})

    car_event = CarEvent(isEntry=False)
    carEvents.document().set(car_event.to_dict())

if __name__ == '__main__':
    carEntryEvent()
    carEntryEvent()
    carExitEvent()



