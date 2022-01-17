# Street-wise

A Flutter Application designed to make going from place to place much safer!

## Built With:

- Flutter for the frontend. 
- Firebase Auth for Authentication
- Firestore for NoSQL Database
- Twilio for SMS communication
- Google Maps API for google maps widget in Flutter. 
- in_app_notifications package for Flutter in app notifications. 

## Inspiration for Street-wise: 
The designer of the team, Tiffany, would always go hang out with her friends. However, her parents would tell her to notify them once she arrives at her destination. A majority of the time, Tiffany would forget to do so and her parents either would also forget or just assume that she got to her destination safely. Street-wise improves this quality of life by allowing parents to automate the process of making sure their child is safe.  

## What Street-wise Does: 

Makes going from place to place much more safe! People such as parents can create a tracker for their child. The adults can specify the name of the tracker, the location where the 
child is going to, and the amount of time before the child and the parents are notified. When the time is up, an SMS is sent to the child while the parent gets an in app
notification directly from the app. Parents can also see where their child is going to by using the Google Maps that is built into the application. Quality of life is greatly 
improved thanks to Street-wise. Parents now no longer have to risk forgetting about their child and not knowing whether or not they are safe. 

##Dependencies and versions

Flutter and Dart Versions: 
- Flutter 1.22.6 • channel stable • https://github.com/flutter/flutter.git
- Framework • revision 9b2d32b605 (12 months ago) • 2021-01-22 14:36:39 -0800
- Engine • revision 2f0af37152
- Tools • Dart 2.10.5

Dependencies in Pubspec.yaml:
  - cupertino_icons: ^1.0.0
  - firebase_auth: 0.14.0+5
  - cloud_firestore: 0.12.9+4
  - android_alarm_manager: 0.4.5+20
  - google_maps_flutter: 0.5.13
  - flutter_local_notifications: 1.4.4+1
  - twilio_flutter: 0.0.1
  - in_app_notification: 0.1.0
