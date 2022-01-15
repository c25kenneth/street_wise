import 'package:flutter/material.dart';
import 'package:street_wise/firebaseauth.dart';
import 'package:street_wise/home.dart';
import 'package:street_wise/signIn.dart';

class Register extends StatefulWidget {
  const Register({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = ''; 

  final formKey = GlobalKey<FormFieldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register for Street Wise!'),
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
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
                dynamic outcome = await signUp(email, password); 
                if (outcome == true) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  print('Cannot sign in. Try again later or check your authentication info.');
                }
              },
              child: Text(
                'Create account!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }