import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pantomimegame/models/score_model.dart';
import 'package:pantomimegame/providers/controllers/controllers.dart';
import 'package:pantomimegame/providers/extensions/extensions.dart';
import 'package:pantomimegame/providers/functions/functions.dart';
import 'package:pantomimegame/views/game_screen.dart';
import 'package:pantomimegame/views/score_page.dart';
import 'package:pantomimegame/views/scores_show.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'dart:math';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class PantomimeGameScreen extends StatelessWidget {
  static CountdownController countDownController = CountdownController();
  static RxInt startState = 0.obs;
  static RxInt errorCounter = 0.obs;
  static RxInt randomItemChangedTimes = 0.obs;
  static bool end = false;
  static var list = [
    "سلطان غم مادر",
    "خواننده زیر زمینی",
    "پدر پسر شجاع",
    "شاگرد مغازه کله‌پزی",
    "دنباله لباس عروس",
    "خط عابر پیاده",
    "بابا طاهر عریان",
    "پشمک حاج عبدالله",
    "به توپ بستن مجلس",
    "کتاب دست دوم",
    "ترفند بازنگری مسئله",
    "گل گاو زبان",
    "قزن قفلی لباس",
    "محل وقوع جرم",
    "سه راه سلفچگان",
    "ایران سرای امید"
  ].obs;
  static var myTimenumber = ''.obs;
  static double mainTimenumber = 0;
  static Random random = Random();
  static RxString randomItem = "".obs;

  static void _changeRandomItem() {
    randomItem.value = list[random.nextInt(list.length)];
  }

  const PantomimeGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (GameScreen.time_string.value != '45 ثانیه') {
      myTimenumber.value = GameScreen.time_string.value.substring(0, 1) +
          GameScreen.time_string.value.substring(10, 12);
      // mainTimenumber = (double.parse(myTimenumber.value) / 100) * 60;
      if (myTimenumber.value.toString().substring(1, 3) != '15') {
        mainTimenumber = ((double.parse(myTimenumber.value) * 60) / 100) + 18;
      } else {
        mainTimenumber = ((double.parse(myTimenumber.value) * 60) / 100) + 6;
      }
    } else {
      mainTimenumber = 45;
    }
    List<Widget> bottomButtons = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => AnimatedOpacity(
              opacity:
                  PantomimeGameScreen.randomItemChangedTimes.value <= 3 ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ZoomTapAnimation(
                  onTap: () {
                    PantomimeGameScreen.randomItemChangedTimes.value += 1;
                    if (PantomimeGameScreen.randomItemChangedTimes.value <= 3) {
                      _changeRandomItem();
                    }
                  },
                  child: Container(
                    width: 80,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(30, 118, 137, 1.0),
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: const Center(
                      child: Text(
                        "تعویض",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ZoomTapAnimation(
              onTap: () {
                startState.value == 0 ? startState.value = 1 : null;
                countDownController.start();
              },
              child: Container(
                width: 80,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(30, 137, 60, 1.0),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Center(
                  child: Text(
                    "شروع",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ZoomTapAnimation(
              onTap: () {
                if (ScoreScreenControllersGet.scores[0]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[0]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[1]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[1]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[1]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[2]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[2]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[2]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[3]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[3]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[3]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[4]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[4]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[4]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[5]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[5]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[5]['status'] = 'Played';
                }
                if (ScorePage.round ==
                        GameScreenControllersGet.number_choeseTeamDore.value &&
                    ScoreScreenControllersGet.scores[GameScreenControllersGet
                                .number_selectedTeamCount.value -
                            1]['status'] ==
                        'Played') {
                  PantomimeGameScreen.end = true;
                  AppAlertDilogs.showAlert(
                    title: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'بازی تمام شد',
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    content: null,
                    actions: [
                      ZoomTapAnimation(
                        onTap: () {
                          context.pushtopage(
                            const ScoresShow(),
                            context,
                            PageTransitionType.fade,
                            const Duration(milliseconds: 3),
                            () {
                              ScorePage.round -= 1;
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: const Text(
                          'متوجه شدم',
                        ),
                      )
                    ],
                    context: context,
                  );
                }
                if (ScoreScreenControllersGet.scores[GameScreenControllersGet
                            .number_selectedTeamCount.value -
                        1]['status'] ==
                    'Played') {
                  ScorePage.round += 1;
                  for (int i = 0;
                      i <= ScoreScreenControllersGet.scores.length - 1;
                      i++) {
                    if (i != 0) {
                      ScoreScreenControllersGet.scores[i]['status'] =
                          'notPlayed';
                    } else {
                      ScoreScreenControllersGet.scores[i]['status'] =
                          'turnToPlay';
                    }
                  }
                  print(ScoreScreenControllersGet.scores);
                }
                countDownController.restart();
                countDownController.pause();
                PantomimeGameScreen.end == false
                    ? AppAlertDilogs.showAlert(
                        title: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'شما باختید',
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        content: null,
                        actions: [
                          ZoomTapAnimation(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'متوجه شدم',
                            ),
                          )
                        ],
                        context: context,
                      )
                    : null;
              },
              child: Container(
                width: 80,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(186, 0, 0, 1.0),
                    Color.fromRGBO(242, 145, 0, 1.0),
                  ]),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Center(
                  child: Text(
                    "غلط",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ZoomTapAnimation(
              onTap: () {
                if (errorCounter == 3) {
                  if (ScoreScreenControllersGet.scores[0]['status'] ==
                      'turnToPlay') {
                    ScoreScreenControllersGet.scores[0]['status'] = 'Played';
                    ScoreScreenControllersGet.scores[1]['status'] =
                        'turnToPlay';
                  } else if (ScoreScreenControllersGet.scores[1]['status'] ==
                      'turnToPlay') {
                    ScoreScreenControllersGet.scores[1]['status'] = 'Played';
                    ScoreScreenControllersGet.scores[2]['status'] =
                        'turnToPlay';
                  } else if (ScoreScreenControllersGet.scores[2]['status'] ==
                      'turnToPlay') {
                    ScoreScreenControllersGet.scores[2]['status'] = 'Played';
                    ScoreScreenControllersGet.scores[3]['status'] =
                        'turnToPlay';
                  } else if (ScoreScreenControllersGet.scores[3]['status'] ==
                      'turnToPlay') {
                    ScoreScreenControllersGet.scores[3]['status'] = 'Played';
                    ScoreScreenControllersGet.scores[4]['status'] =
                        'turnToPlay';
                  } else if (ScoreScreenControllersGet.scores[4]['status'] ==
                      'turnToPlay') {
                    ScoreScreenControllersGet.scores[4]['status'] = 'Played';
                    ScoreScreenControllersGet.scores[5]['status'] =
                        'turnToPlay';
                  } else if (ScoreScreenControllersGet.scores[5]['status'] ==
                      'turnToPlay') {
                    ScoreScreenControllersGet.scores[5]['status'] = 'Played';
                  }
                }

                if (errorCounter.value < 3) {
                  errorCounter.value++;
                } else {
                  if (ScorePage.round ==
                          GameScreenControllersGet
                              .number_choeseTeamDore.value &&
                      ScoreScreenControllersGet.scores[GameScreenControllersGet
                                  .number_selectedTeamCount.value -
                              1]['status'] ==
                          'Played') {
                    PantomimeGameScreen.end = true;
                    AppAlertDilogs.showAlert(
                      title: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'بازی تمام شد',
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      content: null,
                      actions: [
                        ZoomTapAnimation(
                          onTap: () {
                            context.pushtopage(
                              const ScoresShow(),
                              context,
                              PageTransitionType.fade,
                              const Duration(milliseconds: 3),
                              () {
                                ScorePage.round -= 1;
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: const Text(
                            'متوجه شدم',
                          ),
                        )
                      ],
                      context: context,
                    );
                  }
                  if (ScoreScreenControllersGet.scores[GameScreenControllersGet
                              .number_selectedTeamCount.value -
                          1]['status'] ==
                      'Played') {
                    ScorePage.round += 1;
                    for (int i = 0;
                        i <= ScoreScreenControllersGet.scores.length - 1;
                        i++) {
                      if (i != 0) {
                        ScoreScreenControllersGet.scores[i]['status'] =
                            'notPlayed';
                      } else {
                        ScoreScreenControllersGet.scores[i]['status'] =
                            'turnToPlay';
                      }
                    }
                    print(ScoreScreenControllersGet.scores);
                  }
                  countDownController.restart();
                  countDownController.pause();
                  PantomimeGameScreen.end == false
                      ? AppAlertDilogs.showAlert(
                          title: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'شما باختید',
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          content: null,
                          actions: [
                            ZoomTapAnimation(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'متوجه شدم',
                              ),
                            )
                          ],
                          context: context,
                        )
                      : null;
                }
              },
              child: Stack(children: [
                Container(
                  width: 80,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(209, 64, 64, 1.0),
                      Color.fromRGBO(137, 0, 99, 1.0)
                    ]),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: const Center(
                    child: Text(
                      "خطا",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: errorCounter.value != 0,
                    child: Positioned(
                      left: 50,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              errorCounter.value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ZoomTapAnimation(
              onTap: () {
                if (ScoreScreenControllersGet.scores[0]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[0]['score'] += 10;
                  ScoreScreenControllersGet.scores[0]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[1]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[1]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[1]['score'] += 10;
                  ScoreScreenControllersGet.scores[1]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[2]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[2]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[2]['score'] += 10;
                  ScoreScreenControllersGet.scores[2]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[3]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[3]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[3]['score'] += 10;
                  ScoreScreenControllersGet.scores[3]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[4]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[4]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[4]['score'] += 10;
                  ScoreScreenControllersGet.scores[4]['status'] = 'Played';
                  ScoreScreenControllersGet.scores[5]['status'] = 'turnToPlay';
                } else if (ScoreScreenControllersGet.scores[5]['status'] ==
                    'turnToPlay') {
                  ScoreScreenControllersGet.scores[5]['score'] += 10;
                  ScoreScreenControllersGet.scores[5]['status'] = 'Played';
                }
                if (ScorePage.round ==
                        GameScreenControllersGet.number_choeseTeamDore.value &&
                    ScoreScreenControllersGet.scores[GameScreenControllersGet
                                .number_selectedTeamCount.value -
                            1]['status'] ==
                        'Played') {
                  PantomimeGameScreen.end = true;
                  AppAlertDilogs.showAlert(
                    title: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'بازی تمام شد',
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    content: null,
                    actions: [
                      ZoomTapAnimation(
                        onTap: () {
                          context.pushtopage(
                            const ScoresShow(),
                            context,
                            PageTransitionType.fade,
                            const Duration(milliseconds: 3),
                            () {
                              ScorePage.round -= 1;
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: const Text(
                          'متوجه شدم',
                        ),
                      )
                    ],
                    context: context,
                  );
                }
                if (ScoreScreenControllersGet.scores[GameScreenControllersGet
                            .number_selectedTeamCount.value -
                        1]['status'] ==
                    'Played') {
                  ScorePage.round += 1;
                  for (int i = 0;
                      i <= ScoreScreenControllersGet.scores.length - 1;
                      i++) {
                    if (i != 0) {
                      ScoreScreenControllersGet.scores[i]['status'] =
                          'notPlayed';
                    } else {
                      ScoreScreenControllersGet.scores[i]['status'] =
                          'turnToPlay';
                    }
                  }
                  print(ScoreScreenControllersGet.scores);
                }
                countDownController.restart();
                countDownController.pause();
                PantomimeGameScreen.end == false
                    ? AppAlertDilogs.showAlert(
                        title: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'شما 10 امتیاز گرفتید',
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        content: null,
                        actions: [
                          ZoomTapAnimation(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'متوجه شدم',
                            ),
                          )
                        ],
                        context: context,
                      )
                    : null;
              },
              child: Container(
                width: 80,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(30, 137, 60, 1.0),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Center(
                  child: Text(
                    "درست",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ];

    _changeRandomItem();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(6, 5, 36, 1.0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 143,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(4, 5, 22, 1.0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.timer_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Countdown(
                            controller: countDownController,
                            seconds:
                                GameScreenControllersGet.selectd_time_auto.value
                                    ? 300
                                    : mainTimenumber.toInt(),
                            build: (BuildContext context, double time) => Text(
                              '${(time / 60).toString().substring(0, 1)}:${(time.milliseconds * 1000).toString().substring(5, 7)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            interval: const Duration(seconds: 1),
                            onFinished: () {
                              // comment
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Obx(
                () => Text(
                  randomItem.value.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            const Spacer(),
            Obx(
              () => bottomButtons[startState.value],
            )
          ],
        ),
      ),
    );
  }
}
