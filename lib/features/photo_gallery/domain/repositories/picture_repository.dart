import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

abstract class PictureRepository {
  Future<Picture> getPicture({required Picture picture});
  Future<void> storePicture({required Picture picture});
  Future<List<Picture>> getStoredPictures();
}
