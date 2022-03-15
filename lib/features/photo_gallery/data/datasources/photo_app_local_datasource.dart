import 'package:photo_app/core/utils/constants.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PhotoAppLocalDataSource {
  Future<List<Picture>> storePicture({required PictureImpl picture});
  Future<List<Picture>> removePicture({required PictureImpl picture});
  Future<List<Picture>> getStoredPictures();
}

// TODO: tentar melhorar essa logica terrivel aqui

class PhotoAppLocalDataSourceImpl implements PhotoAppLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhotoAppLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<Picture>> storePicture({required PictureImpl picture}) async {
    final storedPictures =
        await sharedPreferences.getStringList(kKeyValue) ?? [];

    final finalList = [
      ...storedPictures,
      picture.toJson(),
    ];

    await sharedPreferences.setStringList(kKeyValue, finalList);
    return _convertPicturesFromStorage();
  }

  @override
  Future<List<Picture>> getStoredPictures() async =>
      _convertPicturesFromStorage();

  @override
  Future<List<Picture>> removePicture({required PictureImpl picture}) async {
    final convertedPictures = await _convertPicturesFromStorage();

    convertedPictures.removeWhere(
      (pic) =>
          pic.path == picture.path && pic.description == picture.description,
    );

    await sharedPreferences.setStringList(
      kKeyValue,
      convertedPictures.map((e) => e.toJson()).toList(),
    );

    return getStoredPictures();
  }

  Future<List<PictureImpl>> _convertPicturesFromStorage() async {
    final storedPictures = await sharedPreferences.getStringList(kKeyValue);
    return storedPictures?.map((pic) => PictureImpl.fromJson(pic)).toList() ??
        [];
  }
}
