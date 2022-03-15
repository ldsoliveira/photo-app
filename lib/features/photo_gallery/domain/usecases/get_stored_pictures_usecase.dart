import 'package:photo_app/features/photo_gallery/data/repositories/picture_repository_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

class GetStoredPicturesUsecase {
  const GetStoredPicturesUsecase({
    required this.repository,
  });

  final PictureRepositoryImpl repository;

  Future<List<Picture>> call() => repository.getStoredPictures();
}
