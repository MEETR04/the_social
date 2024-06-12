import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    var time2 = DateFormat('HH:mm').format(time);
    return  Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color(0xffdcf8c6),
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.only(left: 10,
                bottom: 20,
                right: 80,
                top: 5,),
                child: Text(message,style: TextStyle(fontSize: 20),)),
            Positioned(bottom: 4,
            right: 10,
            child: Row(children: [
      Text(time2,style: TextStyle(color: Colors.black38),),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.done_all,color: Colors.blue,size: 20,)
            ],))
          ],
        ),
      ),),
    );
  }
}
