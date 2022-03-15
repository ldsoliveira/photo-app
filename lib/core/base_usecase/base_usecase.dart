import 'package:equatable/equatable.dart';
import 'package:photo_app/features/photo_gallery/data/models/picture_impl.dart';

abstract class BaseUseCase<T, P> {
  Future<T> call(P params);
}

class Params extends Equatable {
  final PictureImpl picture;

  Params({required this.picture});

  @override
  List<PictureImpl> get props => [picture];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
