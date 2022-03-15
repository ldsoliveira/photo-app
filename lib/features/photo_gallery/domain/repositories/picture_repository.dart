import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';

abstract class PictureRepository {
  Future<List<Picture>> storePicture({required PictureImpl picture});
  Future<List<Picture>> removePicture({required PictureImpl picture});
  Future<List<Picture>> getStoredPictures();
}
