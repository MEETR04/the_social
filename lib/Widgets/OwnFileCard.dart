import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnFileCard extends StatelessWidget {
  const OwnFileCard({super.key, required this.path, required this.message});

  final String path;
  final String message;

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    var time2 = DateFormat('HH:mm').format(time);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Column(
            children: [
              Expanded(
                  child: Image.file(
                File(path),
                fit: BoxFit.fitHeight,
              )),
              message.length > 0
                  ? Container(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(alignment: Alignment.centerLeft,
                            child: Text(message,style: TextStyle(fontSize: 20),)),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
