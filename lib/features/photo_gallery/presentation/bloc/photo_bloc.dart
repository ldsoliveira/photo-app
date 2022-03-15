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
      final picture = await getPictureUsecase(event.picture);
      yield Loaded(pictures: [picture]);
    } else if (event is GetStoredPictures) {
      final pictures = await getStoredPicturesUsecase();
      yield Loaded(pictures: pictures);
    } else if (event is StorePicture) {
      final pictures = await getStoredPicturesUsecase();
      storePictureUsecase(event.picture);
      yield Loaded(pictures: pictures);
    } else {
      throw Exception();
    }
  }
}
