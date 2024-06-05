import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_social/Pages/CameraView.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});


  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController =
      CameraController(cameras[0], ResolutionPreset.high);
  late Future<void> cameravalue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameravalue = _cameraController.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black,
              height: 120,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: (){
                            takephoto(context);
                          },
                          icon: Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                            size: 80,
                          )),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.flip_camera_android,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                  Text(
                    "Tap for photo, Hold for video",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void takephoto(BuildContext context) async {
    final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile picture = await _cameraController.takePicture();
    picture.saveTo(path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraView(imagepath: path)));
  }

}
