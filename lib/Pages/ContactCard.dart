import 'package:flutter/material.dart';
import 'package:the_social/Models/ChatModels.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
            children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 32,
            ),
          ),
              contact.select ? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 12,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                ),
              )
          ) : Container()
        ]),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.status),
    );
    // return ListTile(
    //   title: Text(contact.name),
    //   subtitle: Text(contact.status),
    //   leading:  Stack(
    //     children: [
    //       CircleAvatar(
    //         backgroundColor: Colors.grey,
    //         radius: 30,
    //         child: Icon(
    //           Icons.person,
    //           color: Colors.white,
    //         ),
    //       ),
    //      contact.select ? Positioned(
    //         bottom: 4,
    //           right: 5,
    //           child: CircleAvatar(
    //         backgroundColor: Colors.teal,
    //         radius: 11,
    //         child: Icon(Icons.check,color: Colors.white,size: 17,),
    //       )): Container()
    //     ],
    //   ),
    // );
    return Expanded(
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 29,
              ),
            ),
            contact.select
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 11,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )),
                  )
                : Container(),
          ],
        ),
        title: Text(
          contact.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.status,
        ),
      ),
    );
  }
}
