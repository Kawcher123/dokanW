import 'package:dokan/infrastructure/common_services/theme_service.dart';
import 'package:dokan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> initServices() async {
  Get.log('starting services ...');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  await Get.putAsync<ThemeService>(() async => ThemeService());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.log('All services started...');
}
Future<void> main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Dokan",
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.cupertino,
      themeMode: Get.find<ThemeService>().getThemeMode(),
      theme: Get.find<ThemeService>().getLightTheme(),
      darkTheme: Get.find<ThemeService>().getDarkTheme(),
      getPages: AppPages.routes,
    ),
  );

  FlutterNativeSplash.remove();
}
