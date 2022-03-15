import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/data/repositories/picture_repository_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

class StorePictureUsecase {
  const StorePictureUsecase({
    required this.repository,
  });

  final PictureRepositoryImpl repository;

  Future<List<Picture>> call(PictureImpl picture) =>
      repository.storePicture(picture: picture);
}
