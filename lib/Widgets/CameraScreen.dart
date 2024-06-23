import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:the_social/Pages/CameraView.dart';
import 'package:the_social/Pages/VideoView.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.onImageSend});
  final Function onImageSend;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController =
      CameraController(cameras[0], ResolutionPreset.high);
  late Future<void> cameravalue;
  bool isrecording = false;
  bool isflash = false;
  bool iscamerafront = true;

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
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: CameraPreview(_cameraController));
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
                          onPressed: () {
                            setState(() {
                              isflash = !isflash;
                            });
                            isflash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            isflash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 30,
                          )),
                      GestureDetector(
                          onTap: () {
                            if (!isrecording) {
                              takephoto(context);
                            }
                          },
                          onLongPress: () async {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isrecording = true;
                            });
                          },
                          onLongPressUp: () async {
                            XFile videopath =
                                await _cameraController.stopVideoRecording();
                            setState(() {
                              isrecording = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VideoView(videoPath: videopath.path)));
                          },
                          child: isrecording
                              ? Icon(
                                  Icons.radio_button_checked,
                                  color: Colors.red,
                                  size: 80,
                                )
                              : Icon(
                                  Icons.circle_outlined,
                                  color: Colors.white,
                                  size: 80,
                                )),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              iscamerafront = !iscamerafront;
                            });
                            int camerapos = iscamerafront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras[camerapos], ResolutionPreset.high);
                            cameravalue = _cameraController.initialize();
                          },
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
    XFile picture = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraView(
                  imagepath: picture.path,
                  onSend: widget.onImageSend,
                )));
  }
}
