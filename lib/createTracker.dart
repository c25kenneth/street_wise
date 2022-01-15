import 'package:flutter/material.dart';
import 'package:street_wise/firestore.dart';

class CreateTracker extends StatefulWidget {
  const CreateTracker({ Key key }) : super(key: key);

  @override
  _CreateTrackerState createState() => _CreateTrackerState();
}

class _CreateTrackerState extends State<CreateTracker> {

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
                  await addTracker(trackerName, name, trackeeName, trackeePhoneNumber, trackeeAddress, latitude, longitude, hours, minutes, seconds);
                  Navigator.pop(context);
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