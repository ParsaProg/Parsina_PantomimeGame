import 'package:flutter/material.dart';
import 'package:pantomimegame/routes/getPages.dart';
import 'package:pantomimegame/views/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantomime Game',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'DANA-REGULAR'
      ),
      home: const SplashScreen(),
      getPages: appRoutes,
      defaultTransition: Transition.fade,
    );
  }
}