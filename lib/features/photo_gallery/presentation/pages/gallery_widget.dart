import 'package:flutter/material.dart';
import 'package:photo_app/core/utils/constants.dart';
import 'package:photo_app/features/photo_gallery/presentation/components/build_gallery_widget.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget();

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kMaterialAppTitle),
      ),
      body: BuildGalleryWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/camera_widget'),
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}
