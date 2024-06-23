import 'package:flutter/cupertino.dart';
import 'package:the_social/Widgets/CameraScreen.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  get onImageSend => null;

  @override
  Widget build(BuildContext context) {
    return CameraScreen(onImageSend: onImageSend);
  }
}
