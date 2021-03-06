import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/repositories/picture_repository.dart';
import 'package:photo_app/features/photo_gallery/data/datasources/photo_app_local_datasource.dart';

class PictureRepositoryImpl implements PictureRepository {
  const PictureRepositoryImpl({required this.localDataSource});

  final PhotoAppLocalDataSource localDataSource;

  @override
  Future<List<Picture>> storePicture({required PictureImpl picture}) =>
      localDataSource.storePicture(picture: picture);

  @override
  Future<List<Picture>> getStoredPictures() =>
      localDataSource.getStoredPictures();

  @override
  Future<List<Picture>> removePicture({required PictureImpl picture}) =>
      localDataSource.removePicture(picture: picture);
}
