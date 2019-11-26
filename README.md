# README

## Authors: Kamiar Coffey, Amari Hoogland

## To Run iOS app -> PumpkinPi
* Build via the .xcworkspace (not .xcodeproj) because of CocoaPods dependencies

## To Update the FirebaseDB from the Pi -> firebaseAPI
import databaseManager
call the API .carEntryEvent()
call the API .carExitEvent()

## To Send Commands to the Pi -> Flask Server
use Flask server running on the pi to accept HTTP requests
// TODO

## Dependencies

## Firebase dependencies via CocoaPods.
* To run the iOS app, navigate into PumpkinPi
* Before building the app, run
* $ pod install

## Private Keys
* To connect to firebase from the iOS app, you will need GoogleService-Info.plist
* To connect the pi to firebase, you will need pumpkin-pi-firebase-admin-key.json
* email kamiar.coffey@gmail.com to get these - they contain private API keys are gitignored


#### To Run The Flask App Locally

RUN:
  $ pip install -r requirements.txt

Optional:
    $ virtualenv env
    $ source env/bin/activate
    (env) $ pip install firebase-admin flask

Optional:
    $ pip install firebase-admin flask


* Also make sure you have Google Cloud SDK https://cloud.google.com/sdk/ installed
