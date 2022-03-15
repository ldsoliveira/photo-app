import 'package:get_it/get_it.dart';
import 'package:photo_app/features/photo_gallery/data/datasources/photo_app_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_bloc.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/store_picture_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/remove_picture_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/get_stored_pictures_usecase.dart';
import 'package:photo_app/features/photo_gallery/data/repositories/picture_repository_impl.dart';
import 'package:photo_app/features/photo_gallery/data/datasources/photo_app_local_datasource_impl.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => PhotoBloc(
        getStoredPicturesUsecase: sl(),
        storePictureUsecase: sl(),
        removePictureUsecase: sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => GetStoredPicturesUsecase(repository: sl()));
  sl.registerLazySingleton(() => StorePictureUsecase(repository: sl()));
  sl.registerLazySingleton(() => RemovePictureUsecase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<PictureRepositoryImpl>(() => PictureRepositoryImpl(
        localDataSource: sl(),
      ));

  // Externals
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Datasources
  sl.registerLazySingleton<PhotoAppLocalDataSource>(
      () => PhotoAppLocalDataSourceImpl(sharedPreferences: sl()));
}
