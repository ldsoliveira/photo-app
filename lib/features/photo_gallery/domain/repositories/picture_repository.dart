import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

abstract class PictureRepository {
  Future<Picture> getPicture({required PictureImpl picture});
  Future<List<Picture>> storePicture({required PictureImpl picture});
  Future<List<Picture>> getStoredPictures();
}
