# README

## Authors: Kamiar Coffey, Amari Hoogland

## To Run iOS app -> PumpkinPi
* You MUST build via the .xcworkspace (not .xcodeproj) because of CocoaPods dependencies

## To Update the FirebaseDB
* When the Pi detectes an event, it will push updates to Firebase.
* To simulate this behavior on your local machine, you can run a python script

RUN:
  $ pip install -r requirements.txt

* This includes both firebase-admin and flask

Then RUN:
  $ python3 carEntryEvent.py
  $ python3 carExitEvent.py

To simulate the pi registering a car entering or leaving the lot.
* you should see realtime updates in the cloud
* note! The timestamp is the local time of the machine that pushed the event - NOT the Firebase server time
## To Run the Raspberry Pi
* connect Pi to power source and ethernet cable, and ssh
RUN:
  $ ssh pi@raspberrypi.local
  $ sudo raspi-config to change network settings
  $ password: _______

* run simulation of events
RUN:
  $ cd database
  $ bash simulate

* view video livestream
RUN:
  $ cd stream
  $ python3 rpi_camera.py
  
  open local host webserver page to view
  
## Dependencies

## Firebase dependencies via CocoaPods.
* To run the iOS app, navigate into PumpkinPi
* Before building the app, run
* $ pod install

## Private Keys
* To connect to firebase from the iOS app, you will need GoogleService-Info.plist
* To connect the pi to firebase, you will need pumpkin-pi-firebase-admin-key.json
* email kamiar.coffey@gmail.com to get these - they contain private API keys are .gitignored

## Note:
* The Pi must be connected to a network to push
* The phone must be connected to a network to pull

#### To Run The Flask App Locally

RUN:
  $ pip3 install -r requirements.txt

Optional:
    $ virtualenv env
    $ source env/bin/activate
    (env) $ pip install firebase-admin flask

* Also make sure you have Google Cloud SDK https://cloud.google.com/sdk/ installed

## To Send Commands to the Pi via a Flask Server
* We will use a Flask server running on the pi to accept HTTP requests
* The server will then run the appropriate scripts to control the Pi.
* Not currently fully implemented on the Pi
