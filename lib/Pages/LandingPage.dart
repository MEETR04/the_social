import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_social/Pages/AddPhoneNumber.dart';
import 'package:the_social/Pages/LoginScreen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //SizedBox(height: 20,),
              Image.asset(
                "assets/images/bgl.png",
                color: Colors.greenAccent,
                height: 340,
                width: 340,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        children: [
                          TextSpan(text: "Agree and continue to accept the"),
                          TextSpan(
                              text:
                                  " WhatsApp terms of Service and Privcy Policy",
                              style: TextStyle(color: Colors.green))
                        ])),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginInScreen()));
                },
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 110,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.greenAccent[700],
                    child: Center(
                        child: Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
