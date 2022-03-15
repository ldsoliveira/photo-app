import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/core/base_usecase/base_usecase.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_event.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_state.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/store_picture_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/remove_picture_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/get_stored_pictures_usecase.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final StorePictureUsecase storePictureUsecase;
  final GetStoredPicturesUsecase getStoredPicturesUsecase;
  final RemovePictureUsecase removePictureUsecase;

  PhotoBloc({
    required this.storePictureUsecase,
    required this.getStoredPicturesUsecase,
    required this.removePictureUsecase,
  }) : super(Loading());

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    yield Loading();
    final type = event.runtimeType;

    switch (type) {
      case GetStoredPictures:
        final pictures = await getStoredPicturesUsecase(NoParams());

        if (pictures.isEmpty) {
          yield Empty();
        } else {
          yield Loaded(pictures: pictures);
        }

        break;
      case StorePicture:
        event as StorePicture;
        await storePictureUsecase(Params(picture: event.picture));
        final pictures = await getStoredPicturesUsecase(NoParams());
        yield Loaded(pictures: pictures);
        break;
      case RemovePicture:
        event as RemovePicture;
        final pictures =
            await removePictureUsecase(Params(picture: event.picture));

        if (pictures.isEmpty) {
          yield Empty();
        } else {
          yield Loaded(pictures: pictures);
        }
        break;
      default:
    }
  }
}
