import 'package:equatable/equatable.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class Loading extends PhotoState {}

class Empty extends PhotoState {
  final message = 'No pictures taken yet.';
}

class Loaded extends PhotoState {
  final List<Picture> pictures;

  Loaded({required this.pictures});
}
