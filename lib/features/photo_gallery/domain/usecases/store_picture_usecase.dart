import 'package:photo_app/core/base_usecase/base_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/data/repositories/picture_repository_impl.dart';

class StorePictureUsecase implements BaseUseCase<List<Picture>, Params> {
  const StorePictureUsecase({
    required this.repository,
  });

  final PictureRepositoryImpl repository;

  @override
  Future<List<Picture>> call(Params params) =>
      repository.storePicture(picture: params.picture);
}
