import 'package:flutter/material.dart';

class OwnStatus extends StatelessWidget {
  const OwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: const ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profilepic.png'),
              radius: 30,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    )))
          ],
        ),
        title: Text("My Status",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle: Text("Tap to add status",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)
      ),
    );
  }
}
