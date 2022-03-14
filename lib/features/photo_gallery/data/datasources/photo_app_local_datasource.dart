import 'package:photo_app/core/utils/constants.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PhotoAppLocalDataSource {
  Future<void> storePicture({required Picture picture});
  Future<Picture> getPicture({required Picture picture});
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
  Future<void> storePicture({required Picture picture}) async {
    final storedPictures =
        await sharedPreferences.getStringList(kKeyValue) ?? [];
    await sharedPreferences
        .setStringList(kKeyValue, [...storedPictures, picture.toString()]);
  }

  @override
  Future<List<Picture>> getStoredPictures() async {
    final storedPictures = await sharedPreferences.getStringList(kKeyValue);
    return _convertedPicturesFromStorage(storedPictures);
  }
}

List<Picture> _convertedPicturesFromStorage(List<String>? pictures) =>
    pictures?.map((pic) => PictureImpl.fromJson(pic)).toList() ?? [];
