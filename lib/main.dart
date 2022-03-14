import 'package:flutter/material.dart';
import 'package:photo_app/core/utils/constants.dart';
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
    return MaterialApp(
      title: kMaterialAppTitle,
      theme: AppTheme.theme,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
