import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

class BuildCameraPreview extends StatefulWidget {
  const BuildCameraPreview();

  @override
  State<BuildCameraPreview> createState() => _BuildCameraPreviewState();
}

class _BuildCameraPreviewState extends State<BuildCameraPreview> {
  late CameraController _controller;
  final _assetsAudioPlayer = AssetsAudioPlayer();

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

        await _controller.initialize();
        await _controller.setFlashMode(FlashMode.off);

        setState(() {});
      } catch (e) {
        print(e);
      }
    });

    _assetsAudioPlayer
        .open(Audio('lib/src/core/assets/audios/camera_shutter.mp3'),
            autoStart: false)
        .catchError((e) => print('Error on camera audio asset: $e'));
  }

  Widget _buildBody() {
    if (_controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        child: CameraPreview(_controller),
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
          _assetsAudioPlayer.play();
          final img = await _controller.takePicture();

          final pic = Picture(
            path: img.path,
            description: '',
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
    _controller.dispose();
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
}
