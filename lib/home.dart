import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:street_wise/createTracker.dart';
import 'package:street_wise/firebaseauth.dart';
import 'package:street_wise/locationsMap.dart';
import 'package:street_wise/signIn.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _mapController = Completer(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
        actions: [
          FlatButton(onPressed: () async {
            await signOut(); 
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
          }, child: Text('Sign Out!')),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot){
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('trackers').where('uid', isEqualTo: snapshot.data.uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data.documents == null) {
                  return CircularProgressIndicator(); 
                } 
                else {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    final document = snapshot.data.documents[index];
                    return Container(
                      child: Card(
                        color: Colors.purple[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  document['tracker_name'],
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                                ),
                              ), 
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Destination: ' + document['destination'], 
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Set for ' + document['hours'] + ' hours' + ' ' + document['minutes'] + ' minutes ' + document['seconds'] + ' seconds', 
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  document['trackee_name'] + "'s" + " phone number is " + document['trackee_phone_number'], 
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Destination: ' + document['destination'], 
                                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
                              ),
                            ],
                          ),
                        ),
                      
                      padding: EdgeInsets.all(10.0),
                    );
                  },
                );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTracker()));
        },
        child: Text('📍', style: TextStyle(fontSize: 35)),
      ),
      persistentFooterButtons: [
        StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged, 
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('trackers').where('uid', isEqualTo: snapshot.data.uid).snapshots(),
                builder: (context, snapshot) {   
                  if (!snapshot.hasData || snapshot.data.documents == null) {          
                    return CircularProgressIndicator();
                  } else {
                    final documents = snapshot.data.documents;
                    return Container(
                      width: 900,
                      child: FlatButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LocationsMap(documents: documents, mapController: _mapController, initialPosition: const LatLng(47.61657864660121, -122.20093137521792),)));
                        },
                        label: Text('View Locations on Map!'),
                        icon: Icon(Icons.map), 
                      ),
                    );  
                  }    
                },
              );
            }
          }
        ),
      ],
    );
  }
}