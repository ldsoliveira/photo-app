import 'package:photo_app/core/base_usecase/base_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/data/repositories/picture_repository_impl.dart';

class RemovePictureUsecase implements BaseUseCase<List<Picture>, Params> {
  const RemovePictureUsecase({
    required this.repository,
  });

  final PictureRepositoryImpl repository;

  @override
  Future<List<Picture>> call(Params params) =>
      repository.removePicture(picture: params.picture);
}
