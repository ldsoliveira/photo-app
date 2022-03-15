import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/domain/repositories/picture_repository.dart';

class GetPictureUsecase {
  const GetPictureUsecase({
    required this.repository,
  });

  final PictureRepository repository;

  Future<Picture> call(PictureImpl picture) =>
      repository.getPicture(picture: picture);
}
