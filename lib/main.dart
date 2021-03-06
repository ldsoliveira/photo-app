import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/core/utils/constants.dart';
import 'package:photo_app/features/photo_gallery/presentation/bloc/photo_bloc.dart';
import 'package:photo_app/features/photo_gallery/presentation/pages/gallery_widget.dart';
import 'package:photo_app/injection_container.dart' as di;
import 'package:photo_app/features/photo_gallery/presentation/utils/theme/app_theme.dart';
import 'package:photo_app/features/photo_gallery/presentation/utils/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoBloc>(
      create: (context) => di.sl<PhotoBloc>(),
      child: MaterialApp(
        title: kMaterialAppTitle,
        theme: AppTheme.theme,
        home: GalleryWidget(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
