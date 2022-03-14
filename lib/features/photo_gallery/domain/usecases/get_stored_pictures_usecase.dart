import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/domain/repositories/picture_repository.dart';

class GetStoredPicturesUsecase {
  const GetStoredPicturesUsecase({
    required this.repository,
  });

  final PictureRepository repository;

  Future<List<Picture>> call() => repository.getStoredPictures();
}
