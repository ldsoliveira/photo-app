import 'package:flutter/material.dart';
import 'package:photo_app/features/photo_gallery/presentation/components/build_camera_preview.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget();

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    return BuildCameraPreview();
  }
}
