import 'package:firebase_setup/welcome_screen.dart';
import 'package:firebase_setup/registration_screen.dart';
import 'package:firebase_setup/login_screen.dart';


import 'package:flutter/material.dart';






class WelcomeScreen extends StatefulWidget {

  static String id = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Center(
                child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                    child: Text(
                      'Firebase Setup'
                    ),
                ),
            ),
            
            SizedBox(
              height: 48.0,
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginScreen() )));
              },
              child: Text('Log in'),
            ),


            ElevatedButton(
                onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: ((context) => const RegistrationScreen() )));
                },
                child: Text('Register'),
            ),

          ],
        ),
      ),
    );
  }
}
