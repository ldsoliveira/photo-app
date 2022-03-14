import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/domain/repositories/picture_repository.dart';
import 'package:photo_app/features/photo_gallery/data/datasources/photo_app_local_datasource.dart';

class PictureRepositoryImpl implements PictureRepository {
  const PictureRepositoryImpl({required this.localDataSource});

  final PhotoAppLocalDataSource localDataSource;

  @override
  Future<Picture> getPicture({required Picture picture}) =>
      localDataSource.getPicture(picture: picture);

  @override
  Future<void> storePicture({required Picture picture}) =>
      localDataSource.storePicture(picture: picture);

  @override
  Future<List<Picture>> getStoredPictures() =>
      localDataSource.getStoredPictures();
}
