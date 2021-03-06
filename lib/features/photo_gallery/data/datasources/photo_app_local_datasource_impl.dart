import 'package:photo_app/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/data/datasources/photo_app_local_datasource.dart';

class PhotoAppLocalDataSourceImpl implements PhotoAppLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhotoAppLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<Picture>> storePicture({required PictureImpl picture}) async {
    final storedPictures =
        await sharedPreferences.getStringList(kKeyValue) ?? [];
    final convertedPictures = await _convertPicturesFromStorage();

    /// prevents the behaviour of saving two or more copies of the same picture.
    if (convertedPictures.any((pic) => pic == picture)) {
      return convertedPictures;
    } else {
      await sharedPreferences.setStringList(
        kKeyValue,
        [
          ...storedPictures,
          picture.toJson(),
        ],
      );
      return convertedPictures;
    }
  }

  @override
  Future<List<Picture>> getStoredPictures() async =>
      _convertPicturesFromStorage();

  @override
  Future<List<Picture>> removePicture({required PictureImpl picture}) async {
    final convertedPictures = await _convertPicturesFromStorage();

    convertedPictures.removeWhere((pic) => pic == picture);

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
