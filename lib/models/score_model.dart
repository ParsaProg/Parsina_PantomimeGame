class HistoryModel {
  int round;
  int teamScore;
  String teamName;
  bool isTurn;
  bool isPlayed;
  bool isDeleted;
  HistoryModel({
    required this.isDeleted,
    required this.isPlayed,
    required this.isTurn,
    required this.round,
    required this.teamName,
    required this.teamScore,
  });
}

class HistoryModelControllers{
  static List history = [];
}