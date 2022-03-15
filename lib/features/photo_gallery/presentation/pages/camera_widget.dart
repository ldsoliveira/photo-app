import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget();

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      try {
        final cameras = await availableCameras();
        final firstCamera = cameras.first;

        _controller = CameraController(
          firstCamera,
          ResolutionPreset.max,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );

        await _controller?.initialize();
        await _controller?.setFlashMode(FlashMode.off);

        // isso aqui precisa?
        setState(() {});
      } catch (e) {
        print(e);
      }
    });
  }

  Widget _buildBody() {
    if (_controller?.value.isInitialized ?? false) {
      return AspectRatio(
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        child: CameraPreview(_controller!),
      );
    }

    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final img = await _controller?.takePicture();

          final pic = PictureImpl(
            path: img?.path ?? '',
          );

          Navigator.of(context)
              .pushReplacementNamed('/details_widget', arguments: pic);
        },
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
