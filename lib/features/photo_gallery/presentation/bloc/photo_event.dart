import 'package:equatable/equatable.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class GetPicture extends PhotoEvent {
  final PictureImpl picture;

  GetPicture(this.picture);
}

class StorePicture extends PhotoEvent {
  final PictureImpl picture;

  StorePicture(this.picture);
}

class GetStoredPictures extends PhotoEvent {}
