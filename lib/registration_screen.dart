import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/chat_screen.dart';
import 'package:firebase_setup/constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "Registration_screen";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email ='';
  String password ='';
  final _auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your mail'
              ),

            ),

            SizedBox(
              height: 48.0,
            ),

            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value){
                password = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter your password'
              ),
            ),

            SizedBox(
              height: 48.0,
            ),

            ElevatedButton(
                child: Text('Register'),
                onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
            //create new account
                  try{
                    _auth
                        .createUserWithEmailAndPassword(
                        email: email, password: password).then((value){
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=> const ChatScreen()));
                      print('Successfully Created');
                        });
                  } catch(e){
                    print(e);
                  }

                })
          ],

        ),
      ),

    );
  }
}
