import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/domain/repositories/picture_repository.dart';

class StorePictureUsecase {
  const StorePictureUsecase({
    required this.repository,
  });

  final PictureRepository repository;

  Future<List<Picture>> call(PictureImpl picture) =>
      repository.storePicture(picture: picture);
}
