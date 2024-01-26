import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantomimegame/constants/colors/constants_colors.dart';
import 'package:pantomimegame/constants/vars/vars.dart';
import 'package:pantomimegame/providers/controllers/controllers.dart';
import 'package:pantomimegame/providers/functions/functions.dart';
import 'package:pantomimegame/views/game_start.dart';
import 'package:pantomimegame/widgets/buttons.dart';

class ScorePage extends StatefulWidget {
  static int round = 1;
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    // if (HistoryModelControllers.history.isEmpty) {
    //   for (int i = 1;
    //       i <= GameScreenControllersGet.number_selectedTeamCount.value;
    //       i++) {
    //     HistoryModelControllers.history.add(
    //       HistoryModel(
    //         isDeleted: false,
    //         isPlayed: false,
    //         isTurn: i == 1 ? true : false,
    //         round: 1,
    //         teamName: i == 1
    //             ? GameScreenControllers
    //                 .choese_TeamCountTextFields_controller1.text
    //             : i == 2
    //                 ? GameScreenControllers
    //                     .choese_TeamCountTextFields_controller2.text
    //                 : i == 3
    //                     ? GameScreenControllers
    //                         .choese_TeamCountTextFields_controller3.text
    //                     : i == 4
    //                         ? GameScreenControllers
    //                             .choese_TeamCountTextFields_controller4.text
    //                         : i == 5
    //                             ? GameScreenControllers
    //                                 .choese_TeamCountTextFields_controller5.text
    //                             : GameScreenControllers
    //                                 .choese_TeamCountTextFields_controller6
    //                                 .text,
    //         teamScore: 0,
    //       ),
    //     );
    //   }
    // }
    return Scaffold(
      backgroundColor: GameScreenColors.backgroundcolor,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: AppScreenSize.screenheight(context) / 1.22,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...[1, 2].map(
                        (e) => Text(
                          e == 1 ? 'نام تیم' : 'امتیاز',
                          style: const TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: GameScreenControllersGet
                            .number_selectedTeamCount.value,
                        itemBuilder: (c, int index) {
                          List scores = ScoreScreenControllersGet.scores;
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 40,
                              left: 40,
                              bottom: 20,
                            ),
                            height: 45,
                            decoration: BoxDecoration(
                              color: ScoreScreenControllersGet.scores[index]
                                          ['status'] ==
                                      'turnToPlay'
                                  ? Colors.blue
                                  : ScoreScreenControllersGet.scores[index]
                                              ['status'] ==
                                          'notPlayed'
                                      ? Colors.grey[400]
                                      : ScoreScreenControllersGet.scores[index]
                                                  ['status'] ==
                                              'Played'
                                          ? Colors.green
                                          : ScoreScreenControllersGet
                                                          .scores[index]
                                                      ['status'] ==
                                                  'removed'
                                              ? Colors.red
                                              : null,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    scores[index]['score'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        ScoreScreenControllersGet
                                            .team_Names[index]
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 2,
                                            color: const Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        child: Icon(
                                          (ScoreScreenControllersGet
                                                          .scores[index]
                                                      ['status'] ==
                                                  'turnToPlay'
                                              ? Icons.play_arrow
                                              : ScoreScreenControllersGet
                                                              .scores[index]
                                                          ['status'] ==
                                                      'notPlayed'
                                                  ? Icons.close
                                                  : ScoreScreenControllersGet
                                                                  .scores[index]
                                                              ['status'] ==
                                                          'Played'
                                                      ? Icons.check
                                                      : ScoreScreenControllersGet
                                                                          .scores[
                                                                      index]
                                                                  ['status'] ==
                                                              'removed'
                                                          ? Icons.play_arrow
                                                          : null),
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.grey[800]!,
                            height: 1,
                            width: double.infinity,
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...[1, 2, 3].map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10.0,
                                      left: 10,
                                    ),
                                    child: Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: e == 1
                                              ? Colors.red
                                              : e == 2
                                                  ? Colors.green
                                                  : Colors.blue,
                                          child: Icon(
                                            e == 1
                                                ? Icons.close
                                                : e == 2
                                                    ? Icons.check
                                                    : Icons.play_arrow,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          e == 1
                                              ? 'حذف شده'
                                              : e == 2
                                                  ? 'بازی کرده'
                                                  : 'نوبت بازی',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppScreenSize.screenwidth(context) - 40,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.red, Colors.pink],
                      ),
                      borderRadius: BorderRadius.circular(60)),
                  child: Center(
                    child: Text(
                      'دور ${ScorePage.round} از ${GameScreenControllersGet.number_choeseTeamDore.value.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...[1, 2, 3].map(
                      (e) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: e == 1 && PantomimeGameScreen.end ? 0.5 : 1,
                        child: AppButton(
                          color: e == 1
                              ? Colors.red
                              : e == 2
                                  ? Colors.white
                                  : Colors.blue,
                          content: Padding(
                            padding: e != 2
                                ? e == 3
                                    ? const EdgeInsets.only(left: 25.0)
                                    : const EdgeInsets.only(left: 30)
                                : const EdgeInsets.only(left: 13),
                            child: Row(
                              children: [
                                Text(
                                  e == 1
                                      ? 'شروع'
                                      : e == 2
                                          ? 'نکات و قوانین'
                                          : 'خروج',
                                  style: TextStyle(
                                      color:
                                          e != 2 ? Colors.white : Colors.black,
                                      fontSize: e != 2 ? 18 : 16,
                                      fontWeight:
                                          e == 2 ? FontWeight.w600 : null),
                                ),
                                SizedBox(width: e == 3 ? 5 : 0),
                                Visibility(
                                  visible: e != 2 ? true : false,
                                  child: RotatedBox(
                                    quarterTurns: e != 1 ? 2 : 0,
                                    child: Icon(
                                      e == 1
                                          ? Icons.play_arrow
                                          : Icons.exit_to_app,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          height: 35,
                          onTap: () {
                            if (e == 3) {
                              Navigator.pop(context);
                            } else if (e == 1) {
                              PantomimeGameScreen.end == false
                                  ? StartGame.start(
                                      widget: const PantomimeGameScreen(),
                                      context: context,
                                      then: () {
                                        setState(() {
                                          PantomimeGameScreen
                                              .randomItemChangedTimes.value = 0;
                                        });
                                      })
                                  : null;
                            }
                          },
                          width: 120,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
