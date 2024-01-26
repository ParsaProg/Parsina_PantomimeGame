// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pantomimegame/components/boxshadows/boxshadows.dart';
import 'package:pantomimegame/components/styles/styles.dart';
import 'package:pantomimegame/components/theme/themes.dart';
import 'package:pantomimegame/constants/colors/constants_colors.dart';
import 'package:pantomimegame/constants/strings/constants_strings.dart';
import 'package:pantomimegame/providers/controllers/controllers.dart';
import 'package:pantomimegame/providers/extensions/extensions.dart';
import 'package:pantomimegame/providers/functions/functions.dart';
import 'package:pantomimegame/views/game_start.dart';
import 'package:pantomimegame/views/main_menu.dart';
import 'package:pantomimegame/views/score_page.dart';
import 'package:pantomimegame/widgets/buttons.dart';
import 'package:pantomimegame/widgets/progress_up_down.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GameScreen extends StatefulWidget {
  static List choese_Tornument_containers_strings = [
    AppStrings.tittle_choeseModeMasale_firstContainer,
    AppStrings.tittle_choeseModeMasale_twoContainer,
    AppStrings.tittle_choeseModeMasale_threeContainer,
    AppStrings.tittle_choeseModeMasale_fourContainer,
  ];
  static RxInt time_number = 0.obs;
  static RxString time_string = '45 ثانیه'.obs;
  static List my_times = [
    '45 ثانیه',
    '1 دقیقه و 15 ثانیه',
    '1 دقیقه و 45 ثانیه',
    '2 دقیقه و 15 ثانیه',
    '2 دقیقه و 45 ثانیه',
    '3 دقیقه و 15 ثانیه',
    '3 دقیقه و 45 ثانیه',
    '4 دقیقه و 15 ثانیه',
    '4 دقیقه و 45 ثانیه',
    '5 دقیقه و 15 ثانیه',
    '5 دقیقه و 45 ثانیه'
  ];

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController choese_TeamCountTextFields_controller1 =
      TextEditingController();
  TextEditingController choese_TeamCountTextFields_controller2 =
      TextEditingController();
  TextEditingController choese_TeamCountTextFields_controller3 =
      TextEditingController();
  TextEditingController choese_TeamCountTextFields_controller4 =
      TextEditingController();
  TextEditingController choese_TeamCountTextFields_controller5 =
      TextEditingController();
  TextEditingController choese_TeamCountTextFields_controller6 =
      TextEditingController();
  static void add(c1, c2, c3, c4, c5, c6) {
    ScoreScreenControllersGet.team_Names.clear();
    ScoreScreenControllersGet.team_Names.add(c1.text);
    ScoreScreenControllersGet.team_Names.add(c2.text);
    ScoreScreenControllersGet.team_Names.add(c3.text);
    ScoreScreenControllersGet.team_Names.add(c4.text);
    ScoreScreenControllersGet.team_Names.add(c5.text);
    ScoreScreenControllersGet.team_Names.add(c6.text);
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GameScreenColors.backgroundcolor,
      body: Theme(
        data: AppThemes.scrollBarTheme,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppBar(context),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Choes_Tornument_Mode(screenwidth),
                  const SizedBox(
                    height: 5,
                  ),
                  Choese_CountTeam(screenwidth),
                  const SizedBox(
                    height: 30,
                  ),
                  Choes_TeamNames(),
                  const SizedBox(
                    height: 5,
                  ),
                  Choese_Dore(screenwidth),
                  const SizedBox(
                    height: 30,
                  ),
                  Choese_Times(screenwidth),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  //! Row buttons
                  Buttons_Row(context),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding Buttons_Row(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AppButton(
                color: GameScreenColors.exitButtonColor,
                content: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'امتیازات',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.score,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                height: 40,
                onTap: () {
                  add(
                    choese_TeamCountTextFields_controller1,
                    choese_TeamCountTextFields_controller2,
                    choese_TeamCountTextFields_controller3,
                    choese_TeamCountTextFields_controller4,
                    choese_TeamCountTextFields_controller5,
                    choese_TeamCountTextFields_controller6,
                  );
                  context.pushtopage(
                    const ScorePage(),
                    context,
                    PageTransitionType.leftToRight,
                    const Duration(milliseconds: 400),
                    () {},
                  );
                },
                width: 110),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AppButton(
              color: Colors.white,
              content: const Center(
                  child: Text(
                'راهنمای بازی',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )),
              height: 40,
              onTap: () {},
              width: 110,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AppButton(
                color: GameScreenColors.startButtonColor,
                content: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'شروع بازی',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
                height: 40,
                onTap: () {
                  add(
                    choese_TeamCountTextFields_controller1,
                    choese_TeamCountTextFields_controller2,
                    choese_TeamCountTextFields_controller3,
                    choese_TeamCountTextFields_controller4,
                    choese_TeamCountTextFields_controller5,
                    choese_TeamCountTextFields_controller6,
                  );
                  AppAlertDilogs.showAlert(
                    title: const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('آیا میخواهید تیم های قبلی حذف شوند؟')),
                    content: null,
                    actions: [
                      ZoomTapAnimation(
                        onTap: () {
                          ScorePage.round = 1;
                          PantomimeGameScreen.end = false;
                          ScoreScreenControllersGet.scores = [
                            {'status': 'turnToPlay', 'score': 0},
                            {'status': 'notPlayed', 'score': 0},
                            {'status': 'notPlayed', 'score': 0},
                            {'status': 'notPlayed', 'score': 0},
                            {'status': 'notPlayed', 'score': 0},
                            {'status': 'notPlayed', 'score': 0},
                          ].obs;
                          Navigator.pop(context);
                          if (GameScreenControllersGet.number_selectedTeamMode <
                              3) {
                            context.pushtopage(
                              const ScorePage(),
                              context,
                              PageTransitionType.topToBottom,
                              const Duration(milliseconds: 400),
                              () {
                                GameScreenControllersGet
                                    .number_choeseTeamDore.value = 3;
                                GameScreenControllersGet
                                    .number_selectedTeamCount.value = 2;
                                GameScreenControllersGet
                                    .number_selectedTeamMode.value = 0;
                                ScoreScreenControllersGet.team_Names.clear();
                              },
                            );
                          } else {
                            // ShowSnackBars.showSnackBar(
                            //   titleText: const Text(
                            //     'سوالات پنج ثانیه به زودی',
                            //     textDirection: TextDirection.rtl,
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            //   messageText: const Text(
                            //     'این قسمت در دست ساخت توسط تیم توسعه دهندگان است',
                            //     textDirection: TextDirection.rtl,
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   backgroundColor: Colors.red,
                            //   shouldIconPulse: false,
                            //   icon: const Padding(
                            //     padding: EdgeInsets.only(left: 8.0),
                            //     child: Icon(
                            //       Icons.error,
                            //       color: Color(0xFFFFFFFF),
                            //       size: 30,
                            //     ),
                            //   ),
                            //   dismissDirection: DismissDirection.horizontal,
                            //   forwardAnimationCurve: Curves.fastOutSlowIn,
                            // );
                            context.pushtopage(
                              const MainMenu(),
                              context,
                              PageTransitionType.rightToLeft,
                              const Duration(microseconds: 300),
                              () {},
                            );
                          }
                        },
                        child: const Text(
                          'بله',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ZoomTapAnimation(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'خیر',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                    context: context,
                  );
                },
                width: 110),
          ),
        ],
      ),
    );
  }

  Column Choese_Times(double screenwidth) {
    return Column(
      children: [
        Text(
          AppStrings.tittle_choeseTimeMode,
          style: AppTextStyles.tittle_choeseTimeMode,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  GameScreenControllersGet.changeTimeMode_withhHand();
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: !GameScreenControllersGet.selectd_time_auto.value
                        ? GameScreenColors.selectedTimeMode_Container_ChoeseTime
                        : GameScreenColors
                            .unselectedTimeMode_Container_ChoeseTime,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            GameScreenControllersGet.selectd_time_auto.value ==
                                    false
                                ? const EdgeInsets.only(left: 20.0)
                                : const EdgeInsets.only(left: 0.0),
                        child: Text(
                          AppStrings.choese_TimeMode_withHand,
                          style: TextStyle(
                            fontSize: 17,
                            color: GameScreenControllersGet
                                        .selectd_time_auto.value ==
                                    false
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            GameScreenControllersGet.selectd_time_auto.value ==
                                false,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ZoomTapAnimation(
                onTap: () {
                  GameScreenControllersGet.changeTimeMode_auto();
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: GameScreenControllersGet.selectd_time_auto.value
                        ? GameScreenColors.selectedTimeMode_Container_ChoeseTime
                        : GameScreenColors
                            .unselectedTimeMode_Container_ChoeseTime,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            GameScreenControllersGet.selectd_time_auto.value
                                ? const EdgeInsets.only(left: 20.0)
                                : const EdgeInsets.only(left: 0.0),
                        child: Text(
                          AppStrings.choese_TimeMode_auto,
                          style: TextStyle(
                            fontSize: 17,
                            color:
                                GameScreenControllersGet.selectd_time_auto.value
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            GameScreenControllersGet.selectd_time_auto.value,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => ProgressUp(
            color: Colors.white,
            content: GameScreenControllersGet.selectd_time_auto.value == false
                ? GameScreen.time_string
                : GameScreenControllersGet.number_selectedTeamMode.value == 2
                    ? AppStrings.auto_time_mode_gangi
                    : GameScreenControllersGet.number_selectedTeamMode.value ==
                            3
                        ? AppStrings.auto_time_mode_30Sec
                        : AppStrings.auto_time_mode,
            down: () {
              if (GameScreenControllersGet.selectd_time_auto.value != true) {
                if (GameScreen.time_number.value > 0) {
                  GameScreen.time_number.value--;
                  GameScreen.time_string.value =
                      GameScreen.my_times[GameScreen.time_number.value];
                }
              }
            },
            iconUpColor: Colors.white,
            icondownColor: Colors.white,
            up: () {
              if (GameScreenControllersGet.selectd_time_auto.value != true) {
                if (GameScreen.time_number.value < 10) {
                  GameScreen.time_number.value++;
                  GameScreen.time_string.value =
                      GameScreen.my_times[GameScreen.time_number.value];
                }
              }
            },
            width: screenwidth - 60,
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Column Choese_Dore(double screenwidth) {
    return Column(
      children: [
        Text(
          AppStrings.tittle_choeseDore,
          style: AppTextStyles.gamepage_tittle_choeseDore,
        ),
        const SizedBox(
          height: 10,
        ),
        ProgressUp(
          textStyle:
              AppTextStyles.gamepage_choesecountDore_centerTextof_Container,
          color: GameScreenColors.tittle_choeseCountDore_Container,
          content: GameScreenControllersGet.number_choeseTeamDore,
          down: () {
            GameScreenControllersGet.dore_count_down();
          },
          iconUpColor: GameScreenColors.upCount_ButtonColor_choeseDore,
          icondownColor: Colors.white,
          up: () {
            GameScreenControllersGet.dore_count_up();
          },
          width: screenwidth - 60,
        )
      ],
    );
  }

  Column Choes_TeamNames() {
    return Column(
      children: [
        Text(
          AppStrings.tittle_choeseTeamNames,
          style: AppTextStyles.gamepage_choeseTeamNames_tittletext,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 190,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 50,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, int num) {
                    choese_TeamCountTextFields_controller1.text = 'تیم اول';
                    choese_TeamCountTextFields_controller2.text = 'تیم دوم';
                    choese_TeamCountTextFields_controller3.text = 'تیم سوم';
                    choese_TeamCountTextFields_controller4.text = 'تیم چهارم';
                    choese_TeamCountTextFields_controller5.text = 'تیم پنجم';
                    choese_TeamCountTextFields_controller6.text = 'تیم ششم';
                    return Padding(
                      padding: num % 2 != 0
                          ? const EdgeInsets.only(right: 10)
                          : const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5),
                          child: Obx(
                            () => TextField(
                              enabled: num >=
                                      GameScreenControllersGet
                                          .number_selectedTeamCount.value
                                  ? false
                                  : true,
                              style: num <
                                      GameScreenControllersGet
                                          .number_selectedTeamCount.value
                                  ? const TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                              controller: num == 0
                                  ? choese_TeamCountTextFields_controller1
                                  : num == 1
                                      ? choese_TeamCountTextFields_controller2
                                      : num == 2
                                          ? choese_TeamCountTextFields_controller3
                                          : num == 3
                                              ? choese_TeamCountTextFields_controller4
                                              : num == 4
                                                  ? choese_TeamCountTextFields_controller5
                                                  : choese_TeamCountTextFields_controller6,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Column Choese_CountTeam(double screenwidth) {
    return Column(
      children: [
        Text(
          AppStrings.tittle_choeseTeamCount,
          style: AppTextStyles.gamepage_choeseTeamCount_tittletext,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: screenwidth - 60,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: GameScreenColors.container_choese_countTeam),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  GameScreenControllersGet.number_selectedTeamCount_down();
                },
                child: CircleAvatar(
                  backgroundColor:
                      GameScreenColors.downCount_ButtonColor_choeseDore,
                  radius: 23,
                  child: Icon(
                    Icons.remove,
                    color:
                        GameScreenColors.tittle_choeseCountTeam_iconButtonminus,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  GameScreenControllersGet.number_selectedTeamCount.value
                      .toString(),
                  style: AppTextStyles
                      .gamepage_choesecountTeam_centerTextof_Container,
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  GameScreenControllersGet.number_selectedTeamCount_up();
                },
                child: CircleAvatar(
                  backgroundColor:
                      GameScreenColors.upCount_ButtonColor_choeseDore,
                  radius: 23,
                  child: Icon(
                    Icons.add,
                    color:
                        GameScreenColors.tittle_choeseCountTeam_iconButtonplus,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column Choes_Tornument_Mode(double screenwidth) {
    return Column(
      children: [
        Text(
          AppStrings.tittle_choeseModeMasale,
          style: AppTextStyles.gamepage_choeseModeMasale_tittletext,
        ),
        SizedBox(
          width: screenwidth - 60,
          height: 260,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: GameScreen.choese_Tornument_containers_strings.length,
            itemBuilder: (context, index) {
              return ZoomTapAnimation(
                onTap: () {
                  GameScreenControllersGet.number_selectedTeamMode_void(index);
                },
                child: Obx(
                  () => Container(
                    margin: const EdgeInsets.only(top: 19),
                    height: 40,
                    decoration: BoxDecoration(
                      color: GameScreen
                                  .choese_Tornument_containers_strings[index] ==
                              GameScreen.choese_Tornument_containers_strings[
                                  GameScreenControllersGet
                                      .number_selectedTeamMode.value]
                          ? GameScreenColors.selected_TornumentMode
                          : GameScreenColors.unselected_TornumentMode,
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:
                          AppBoxShadows.gamepage_choesModeTornument_containers,
                    ),
                    child: Center(
                      child: Text(
                        GameScreen.choese_Tornument_containers_strings[index],
                        style: AppTextStyles
                            .gamepage_choeseModeMasale_centerTextof_Containers,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Row AppBar(BuildContext contextAppBar) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'تعریف و ساخت مسابقات',
          style: AppTextStyles.gamepage_appbar_tittleText,
        ),
        ZoomTapAnimation(
          onTap: () {
            AppAlertDilogs.showAlert(
              title: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('آیا میخواهید خارج شوید؟')),
              content: null,
              actions: [
                ZoomTapAnimation(
                  onTap: () => exit(1),
                  child: const Text(
                    'بله',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ZoomTapAnimation(
                  onTap: () => Navigator.pop(contextAppBar),
                  child: const Text(
                    'خیر',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
              context: contextAppBar,
            );
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: GameScreenColors.tittle_appbar_closeButtonColor,
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              boxShadow: AppBoxShadows.gamepage_appbar_closeButton,
            ),
            child: const Center(
              child: Icon(
                Icons.close,
                size: 23,
              ),
            ),
          ),
        )
      ],
    );
  }
}
