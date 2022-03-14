import 'package:equatable/equatable.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class GetPicture extends PhotoEvent {
  final Picture picture;

  GetPicture(this.picture);
}

class StorePicture extends PhotoEvent {
  final Picture picture;

  StorePicture(this.picture);
}

class GetStoredPictures extends PhotoEvent {}
