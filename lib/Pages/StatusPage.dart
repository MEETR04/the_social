import 'package:flutter/material.dart';
import 'package:the_social/Widgets/OtherStatus.dart';
import 'package:the_social/Widgets/OwnStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey[300],
              child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25,
                  ))),
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal,
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OwnStatus(),
            Container(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.grey,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Recent Updates",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
            OtherStatus(
              name: 'Meet Rasania',
              time: '2:00 PM',
              image: 'assets/images/profilepic.png',
            ),
            OtherStatus(
              name: 'Hetal Rasania',
              time: 'today 3:00 PM',
              image: 'assets/images/profilepic.png',
            ),
            OtherStatus(
              name: 'Vaibhavi Rasania',
              time: '4:00 PM',
              image: 'assets/images/profilepic.png',
            ),
            OtherStatus(
              name: 'Kalpesh Rasania',
              time: 'today 5:00 PM',
              image: 'assets/images/profilepic.png',
            ),
          ],
        ),
      ),
    );
  }
}
