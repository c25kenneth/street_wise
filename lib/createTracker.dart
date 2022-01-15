import 'package:flutter/material.dart';

class CreateTracker extends StatefulWidget {
  const CreateTracker({ Key key }) : super(key: key);

  @override
  _CreateTrackerState createState() => _CreateTrackerState();
}

class _CreateTrackerState extends State<CreateTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Tracker'),),
    );
  }
}