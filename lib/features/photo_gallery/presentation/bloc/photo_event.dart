import 'package:equatable/equatable.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class GetStoredPictures extends PhotoEvent {}

class StorePicture extends PhotoEvent {
  final PictureImpl picture;

  StorePicture(this.picture);
}

class RemovePicture extends PhotoEvent {
  final PictureImpl picture;

  RemovePicture(this.picture);
}
