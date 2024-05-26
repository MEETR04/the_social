import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_social/Pages/Homepage.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 50,left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/img.png',width: 80, height: 80,),
            SizedBox(width: 90,),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("data")],
              ),
            ),
          ],
        ),
      )
    );
  }
}
