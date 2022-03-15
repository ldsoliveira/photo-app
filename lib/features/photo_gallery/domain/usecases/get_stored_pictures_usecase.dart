import 'package:photo_app/core/base_usecase/base_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/data/repositories/picture_repository_impl.dart';

class GetStoredPicturesUsecase implements BaseUseCase<List<Picture>, NoParams> {
  const GetStoredPicturesUsecase({
    required this.repository,
  });

  final PictureRepositoryImpl repository;

  @override
  Future<List<Picture>> call(NoParams) => repository.getStoredPictures();
}
