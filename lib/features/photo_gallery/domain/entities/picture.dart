import 'package:equatable/equatable.dart';

class Picture extends Equatable {
  const Picture({
    required this.path,
    this.description,
  });

  final String path;
  final String? description;

  @override
  List<Object?> get props => [path, description];
}
