import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pantomimegame/providers/extensions/extensions.dart';
import 'package:pantomimegame/views/game_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.removeUntillPush(
        context,
        const GameScreen(),
        false,
        PageTransitionType.bottomToTop,
        const Duration(milliseconds: 600)
      ),
    );
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 133, 106, 1.0),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 340,
                      height: 340,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white10,
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                    ),
                    Container(
                      width: 260,
                      height: 260,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                    ),
                    Container(
                      width: 220,
                      height: 220,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/images/tittle_image.png'),
                    ),
                  ],
                ),
              ),
              const Center(
                  child: Text(
                "پانتومیم",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
              const Center(
                  child: Text(
                "سرگرمی جمعی و خانوادگی",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              const Spacer(),
              const SpinKitChasingDots(
                color: Colors.white,
                size: 30.0,
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "ساخته شده توسط تیم پارسینا",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              )
            ],
          ),
        ),
      );
  }
}
