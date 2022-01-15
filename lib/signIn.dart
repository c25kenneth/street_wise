import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:street_wise/firebaseauth.dart';
import 'package:street_wise/home.dart';
import 'package:street_wise/register.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = '';
  String password = ''; 

  final formKey = GlobalKey<FormFieldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Into Street Wise!'),
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
            }, 
            child: Text('Sign In')
          ),
        ],
      ),
      body: Column(
        children: [
        SizedBox(height: 15.0,),
          Padding(
            child: TextFormField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'someone@gmail.com'
              ),
              onChanged: (val) {
                setState(() {
                  email = val; 
                });
              },
              validator: (val) => val.isEmpty == true ? 'Please enter an email!' : null,
            ),
            padding: EdgeInsets.all(15),
            
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password here'
              ),
              validator: (val) => val.length < 6 ? 'Enter a password that is at least 6 characters': null,
              
              onChanged: (val) {
                setState(() {
                  password = val; 
                });
              },
              obscureText: true,
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            height: 70,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () async {
                dynamic outcome = await signIn(email, password); 
                if (outcome == true) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  print('Cannot sign in. Try again later or check your authentication info.');
                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}