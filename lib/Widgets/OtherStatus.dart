import 'package:flutter/material.dart';
class OtherStatus extends StatelessWidget {
  const OtherStatus({super.key, required this.name, required this.time, required this.image});
  final String name;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        title: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle: Text(time,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
      ),
    );
  }
}
