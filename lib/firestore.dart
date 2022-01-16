import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <bool> addTracker (String trackerName, String name, String trackeeName, String trackeePhoneNumber, String trackeeDestination, String latitude, String longitude, String hours, String minutes, String seconds) async {
  try {
    FirebaseUser user = await FirebaseAuth.instance.currentUser(); 
    String userID = user.uid; 
    CollectionReference trackers = Firestore.instance.collection('trackers'); 
    await trackers.add({
      'tracker_name' : trackerName, 
      'name' : name, 
      'trackee_name' : trackeeName, 
      'trackee_phone_number' : trackeePhoneNumber, 
      'destination' : trackeeDestination, 
      'latitude' : latitude, 
      'longitude' : longitude, 
      'hours' : hours, 
      'minutes' : minutes, 
      'seconds' : seconds,
      'uid' : userID,
    });
    return true; 
  } catch (e) {
    print(e.toString()); 
    return false; 
  }
}
