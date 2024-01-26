import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantomimegame/constants/colors/constants_colors.dart';
import 'package:pantomimegame/providers/controllers/controllers.dart';
import 'package:pantomimegame/widgets/buttons.dart';
class ScoresShow extends StatelessWidget {
  const ScoresShow({super.key});

  @override
  Widget build(BuildContext context) {
    List scores = [];
    int maxScore = 0;
    for (int i = 0; i <= ScoreScreenControllersGet.scores.length - 1; i++) {
      scores.add(ScoreScreenControllersGet.scores[i]['score']);
    }
    maxScore = scores.reduce((value, element) => value > element ? value : element);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 49, 85),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'برنده',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'تیم فلان با ${maxScore} امتیاز',
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            AppButton(
              color: Colors.blue,
              content: const Center(
                  child: Text(
                'بازگشت به امتیازات',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              height: 50,
              onTap: () {
                Navigator.pop(context);
              },
              width: context.width - 30,
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'این قسمت کامل نیست و در حال توسعه توسط تیم هست',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
