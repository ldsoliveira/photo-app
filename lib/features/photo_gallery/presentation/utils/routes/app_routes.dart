import 'package:flutter/material.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/presentation/pages/camera_widget.dart';
import 'package:photo_app/features/photo_gallery/presentation/pages/details_widget.dart';
import 'package:photo_app/features/photo_gallery/presentation/pages/gallery_widget.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const GalleryWidget());

      case '/details_widget':
        return _materialRoute(
            DetailsWidget(picture: settings.arguments as PictureImpl));

      case '/camera_widget':
        return _materialRoute(const CameraWidget());

      default:
        return _materialRoute(const GalleryWidget());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
