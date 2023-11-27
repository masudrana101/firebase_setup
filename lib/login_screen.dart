import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/chat_screen.dart';
import 'package:firebase_setup/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = "Login_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              height: 24.0,
            ),

            ElevatedButton(
                child: Text('Log in'),
                onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  //Login to existing account
                  try{
                    _auth
                        .signInWithEmailAndPassword(
                        email: email, password: password).then((value){
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=> const ChatScreen()));
                    });
                    print('Successfully Login');
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
