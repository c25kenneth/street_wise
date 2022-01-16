import 'dart:async';
import 'package:flutter/material.dart';
import 'package:street_wise/firestore.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class CreateTracker extends StatefulWidget {
  const CreateTracker({ Key key }) : super(key: key);

  @override
  _CreateTrackerState createState() => _CreateTrackerState();
}

class _CreateTrackerState extends State<CreateTracker> {
  TwilioFlutter twilioFlutter; 
  String trackerName = ''; 
  String name = '';
  String trackeeName = '';
  String trackeePhoneNumber = '';
  String trackeeAddress = ''; 
  String latitude = ''; 
  String longitude = '';
  String hours = '';
  String minutes = '';
  String seconds = ''; 
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
      accountSid: 'AC07c124dab9ac7246efaf5c8dc8ae429c',
      authToken: '55239837a041cc46b2ce0de02217d895', 
      twilioNumber: '+19362463603',
    );
    super.initState();
  }

  void sendSms(String phoneNumber, String name, String trackerName) async {
    await twilioFlutter.sendSMS(toNumber: phoneNumber, messageBody: '$name from $trackerName is looking for you!');
    print('message printed!');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Tracker'),),
      body: SingleChildScrollView(
              child: Column(
          children: [
            SizedBox(height: 15.0,),
            Padding(
              child: TextFormField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tracker Name',
                  hintText: 'My Awesome Tracker for Jane!'
                ),
                onChanged: (val) {
                  setState(() {
                    trackerName = val; 
                  });
                },
                validator: (val) => val.isEmpty == true ? 'Please enter a tracker name!' : null,
              ),
              padding: EdgeInsets.all(15),
              
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                  hintText: 'John Doe'
                ),
                validator: (val) => val.isEmpty == true ? 'Please enter in your name!': null,
                
                onChanged: (val) {
                  setState(() {
                    name = val; 
                  });
                },
                
              ),
            ),
            Padding(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of Hours for Timer',
                  hintText: '1'
                ),
                onChanged: (val) {
                  setState(() {
                    hours = val; 
                    _hours = int.parse(val);
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the trackee's name!" : null,
              ),
              padding: EdgeInsets.all(15),
            ),
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of Minutes for Timer',
                  hintText: '5'
                ),
                onChanged: (val) {
                  setState(() {
                    minutes = val; 
                    _minutes = int.parse(val); 
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the trackee's name!" : null,
              ),
              padding: EdgeInsets.all(15),         
            ),
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of Seconds for Timer',
                  hintText: '10'
                ),
                onChanged: (val) {
                  setState(() {
                    seconds = val; 
                    _seconds = int.parse(val);
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the trackee's name!" : null,
              ),
              padding: EdgeInsets.all(15),
              
            ),
            Padding(
              child: TextFormField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Trackee name',
                  hintText: 'Jane Doe'
                ),
                onChanged: (val) {
                  setState(() {
                    trackeeName = val; 
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the trackee's name!" : null,
              ),
              padding: EdgeInsets.all(15),            
           ),
           Padding(
              child: TextFormField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Trackee Phone Number',
                  hintText: '1234567890'
                ),
                onChanged: (val) {
                  setState(() {
                    trackeePhoneNumber = val; 
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the trackee's name!" : null,
              ),
              padding: EdgeInsets.all(15),
              
            ),
            Padding(
              child: TextFormField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Trackee's Destination",
                  hintText: '1234 NE 15th PL Houston, Texas, 12345'
                ),
                onChanged: (val) {
                  setState(() {
                    trackeeAddress = val; 
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the trackee's name!" : null,
              ),
              padding: EdgeInsets.all(15),
            ),
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Latitude of meeting place',
                  hintText: 'Latitude'
                ),
                onChanged: (val) {
                  setState(() {
                    latitude = val; 
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the location's latitude!" : null,
              ),
              padding: EdgeInsets.all(15),
            ),
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Longitude of meeting place',
                  hintText: 'Longitude'
                ),
                onChanged: (val) {
                  setState(() {
                    longitude = val; 
                  });
                },
                validator: (val) => val.isEmpty == true ? "Please enter the location's longitude" : null,
              ),
              padding: EdgeInsets.all(15),
              
            ),
            SizedBox(height: 25.0),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  var result = await addTracker(trackerName, name, trackeeName, trackeePhoneNumber, trackeeAddress, latitude, longitude, hours, minutes, seconds);
                  if (result == true) {
                    Timer(Duration(hours: _hours, minutes: _minutes, seconds: _seconds), () {
                      sendSms(trackeePhoneNumber, name, trackerName);
                      InAppNotification.of(context).show(
                        child: Card(
                          child: Column(
                            children: [
                              Text('It has been a while since $trackeeName has reached out. We recommend checking up on them.', style: TextStyle(fontSize: 24),),
                            ],
                          ),
                        ),
                        onTap: () => print('Notification tapped!'),
                        duration: Duration(seconds: 10),
);
                      Navigator.pop(context); 
                    });
                  }
                },
                child: Text(
                  'Create tracker!',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}

