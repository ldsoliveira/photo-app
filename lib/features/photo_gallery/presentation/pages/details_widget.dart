import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/core/utils/constants.dart';
import 'package:photo_app/features/photo_gallery/domain/entities/picture.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_bloc.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_event.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    required this.picture,
  });

  final Picture picture;

  @override
  _DetailsWidget createState() => _DetailsWidget();
}

class _DetailsWidget extends State<DetailsWidget> {
  final _controller = TextEditingController();
  late final PhotoBloc bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _controller.text = widget.picture.description;
      bloc = BlocProvider.of<PhotoBloc>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kMaterialAppTitle),
        actions: [
          IconButton(
            onPressed: () => bloc.add(
              StorePicture(widget.picture),
            ),
            icon: Icon(Icons.check),
          ),
          IconButton(
            onPressed: () {
              // TODO: remove picture usecase
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[300],
                child: Image.file(
                  File(widget.picture.path),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                maxLength: 250,
                decoration: InputDecoration(
                  label: Text('Description (optional)'),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                controller: _controller,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
