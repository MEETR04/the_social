import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key, required this.imagepath});
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.crop,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.title,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height - 180,
              child: Image.file(
                File(imagepath),
                fit: BoxFit.cover,
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                child: TextFormField(
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption...",
                      prefixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.add_photo_alternate_rounded,
                            color: Colors.white,
                            size: 35,
                          )
                      ),
                    suffixIcon: CircleAvatar(
                      backgroundColor: Color(0xFF075E54),
                      child: IconButton(onPressed: null, icon: Icon(Icons.send,color: Colors.white,)),
                    ),
                    hintStyle: TextStyle(color: Colors.white,fontSize: 20)
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
