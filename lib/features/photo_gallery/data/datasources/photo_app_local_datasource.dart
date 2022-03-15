import 'package:photo_app/core/utils/constants.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PhotoAppLocalDataSource {
  Future<List<Picture>> storePicture({required PictureImpl picture});
  Future<Picture> getPicture({required PictureImpl picture});
  Future<List<Picture>> removePicture({required PictureImpl picture});
  Future<List<Picture>> getStoredPictures();
}

class PhotoAppLocalDataSourceImpl implements PhotoAppLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhotoAppLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Picture> getPicture({required Picture picture}) async {
    final storedPictures = await sharedPreferences.getStringList(kKeyValue);
    final convertedPictures = _convertedPicturesFromStorage(storedPictures);
    return convertedPictures.firstWhere((pic) => pic.props == picture.props);
  }

  @override
  Future<List<Picture>> storePicture({required PictureImpl picture}) async {
    final storedPictures =
        await sharedPreferences.getStringList(kKeyValue) ?? [];

    final finalList = [
      ...storedPictures,
      picture.toJson(),
    ];

    await sharedPreferences.setStringList(kKeyValue, finalList);
    return _convertedPicturesFromStorage(finalList);
  }

  @override
  Future<List<Picture>> getStoredPictures() async {
    final storedPictures = await sharedPreferences.getStringList(kKeyValue);
    return _convertedPicturesFromStorage(storedPictures);
  }

  @override
  Future<List<Picture>> removePicture({required PictureImpl picture}) async {
    final storedPictures = await sharedPreferences.getStringList(kKeyValue);
    final convertedPictures = _convertedPicturesFromStorage(storedPictures);
    convertedPictures.removeWhere(
      (pic) => pic.props == picture.props,
    );

    await sharedPreferences.setStringList(
      kKeyValue,
      convertedPictures.map((e) => e.toJson()).toList(),
    );

    return getStoredPictures();
  }
}

List<PictureImpl> _convertedPicturesFromStorage(List<String>? pictures) =>
    pictures?.map((pic) => PictureImpl.fromJson(pic)).toList() ?? [];
