import 'package:flutter/material.dart';
import 'package:street_wise/createTracker.dart';
import 'package:street_wise/firebaseauth.dart';
import 'package:street_wise/signIn.dart';
class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTracker()));
        },
        child: Text('📍', style: TextStyle(fontSize: 35)),
      ),
    );
  }
}