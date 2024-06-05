import 'dart:io';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key, required this.imagepath});
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Image.file(File(imagepath)),
    );
  }
}
