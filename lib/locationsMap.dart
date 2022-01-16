import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationsMap extends StatefulWidget {
  const LocationsMap({ Key key, this.documents }) : super(key: key);

  final List<DocumentSnapshot> documents; 
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
    );
  }
}