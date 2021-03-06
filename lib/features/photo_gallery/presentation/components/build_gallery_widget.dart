import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_bloc.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_event.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_state.dart';

class BuildGalleryWidget extends StatelessWidget {
  const BuildGalleryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
      if (state is Empty) {
        return Center(
          child: Text(
            state.message,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }

      if (state is Loaded) {
        return GridView.builder(
          padding: EdgeInsets.all(8),
          itemCount: state.pictures.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 2.5,
            mainAxisSpacing: 2.5,
          ),
          itemBuilder: (ctx, index) => InkWell(
            child: Image.file(
              File(state.pictures[index].path),
            ),
            onTap: () => Navigator.of(context).pushNamed(
              '/details_widget',
              arguments: state.pictures[index],
            ),
          ),
        );
      }

      BlocProvider.of<PhotoBloc>(context).add(GetStoredPictures());
      return Center(child: CircularProgressIndicator());
    });
  }
}
