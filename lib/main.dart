import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:vezzeta_clone/core/routes/pages.dart';
import 'package:vezzeta_clone/core/routes/routes_name.dart';
import 'app_theme.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Doctor App',
      theme: AppTheme.light(context),
      initialRoute: RoutesName.splash,
      onGenerateRoute: AppRoute.generate,
    );

  }
}
