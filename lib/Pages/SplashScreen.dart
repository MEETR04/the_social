
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_social/Models/ChatModels.dart';
import 'package:the_social/Pages/Homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required sourcechat, required this.sourcechats});
  final ChatModel sourcechats;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(
                  chatModel: [],
                  sourcechat: widget.sourcechats,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset('assets/images/wpsymbol.png')));
  }
}
