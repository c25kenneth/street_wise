import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationsMap extends StatefulWidget {
  const LocationsMap({ Key key, this.documents, this.initialPosition, this.mapController }) : super(key: key);

  final List<DocumentSnapshot> documents; 
  final LatLng initialPosition; 
  final Completer<GoogleMapController> mapController; 

  @override
  _LocationsMapState createState() => _LocationsMapState();
}

class _LocationsMapState extends State<LocationsMap> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen!')
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: widget.initialPosition, zoom: 12), 
        onMapCreated: (mapController) {
          widget.mapController.complete(mapController); 
        },
      ),
    );
  }
}