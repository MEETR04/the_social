import 'package:flutter/material.dart';
class Contactcard extends StatefulWidget {
  const Contactcard({super.key});

  @override
  State<Contactcard> createState() => _ContactcardState();
}

class _ContactcardState extends State<Contactcard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          child: Icon(Icons.person,color: Colors.white,size: 29,),
        ),
        title: Text("Meet Rasania",style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text("A Flutter Developer",),
      ),
    );
  }
}
