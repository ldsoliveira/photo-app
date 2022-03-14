import 'dart:convert';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

class PictureImpl extends Picture {
  PictureImpl({
    required this.path,
    required this.description,
  }) : super(
          path: path,
          description: description,
        );

  @override
  final String path;
  @override
  final String description;

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'description': description,
    };
  }

  factory PictureImpl.fromMap(Map<String, dynamic> map) {
    return PictureImpl(
      path: map['path'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PictureImpl.fromJson(String source) =>
      PictureImpl.fromMap(json.decode(source));
}
