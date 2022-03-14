import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/get_picture_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/get_stored_pictures_usecase.dart';
import 'package:photo_app/features/photo_gallery/domain/usecases/store_picture_usecase.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_event.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final StorePictureUsecase storePictureUsecase;
  final GetPictureUsecase getPictureUsecase;
  final GetStoredPicturesUsecase getStoredPicturesUsecase;

  PhotoBloc({
    required this.getPictureUsecase,
    required this.storePictureUsecase,
    required this.getStoredPicturesUsecase,
  }) : super(Empty());

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    yield Loading();

    if (event is GetPicture) {
      getPictureUsecase(event.picture);
    } else if (event is GetStoredPictures) {
      getStoredPicturesUsecase();
    } else if (event is StorePicture) {
      storePictureUsecase(event.picture);
    } else {
      throw Exception();
    }
  }
}
