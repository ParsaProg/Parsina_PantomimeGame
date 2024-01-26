// ignore_for_file: file_names

import 'package:get/get.dart' show GetPage;
import 'package:pantomimegame/views/game_screen.dart';
import 'package:pantomimegame/views/splash_screen.dart';

List<GetPage<dynamic>> appRoutes = [
  GetPage(name: '/splashscreen', page: () => const SplashScreen()),
  GetPage(name: '/gamescreen', page: () => const GameScreen()),
];