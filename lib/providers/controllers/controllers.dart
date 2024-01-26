// ignore_for_file: non_constant_identifier_names
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GameScreenControllersGet {
  static RxInt number_selectedTeamMode = 0.obs;
  static RxInt number_selectedTeamCount = 2.obs;
  static RxInt number_choeseTeamDore = 3.obs;
  static RxBool selectd_time_auto = true.obs;
  static void number_selectedTeamMode_void(int index) {
    number_selectedTeamMode.value = index;
    if (index == 3) {
      selectd_time_auto.value = true;
    }
  }

  //! Team count functions
  static void number_selectedTeamCount_up() {
    if (number_selectedTeamCount < 6) {
      number_selectedTeamCount++;
    }
  }

  static void number_selectedTeamCount_down() {
    if (number_selectedTeamCount > 2) {
      number_selectedTeamCount--;
    }
  }

  //? Dore Ccount functions
  static void dore_count_up() {
    if (number_choeseTeamDore.value < 30) {
      number_choeseTeamDore.value++;
    }
  }

  static void dore_count_down() {
    if (number_choeseTeamDore.value > 3) {
      number_choeseTeamDore.value--;
    }
  }

  //* Times
  static void changeTimeMode_auto() {
    selectd_time_auto.value = true;
  }

  static void changeTimeMode_withhHand() {
    if (number_selectedTeamMode.value != 3) {
      selectd_time_auto.value = false;
    }
  }
}

class ScoreScreenControllersGet {
  static List team_Names = [];
  static List scores = [
    {'status': 'turnToPlay', 'score': 0},
    {'status': 'notPlayed', 'score': 0},
    {'status': 'notPlayed', 'score': 0},
    {'status': 'notPlayed', 'score': 0},
    {'status': 'notPlayed', 'score': 0},
    {'status': 'notPlayed', 'score': 0},
  ].obs;
}
