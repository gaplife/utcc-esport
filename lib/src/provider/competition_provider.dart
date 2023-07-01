import 'package:flutter/widgets.dart';

class CompetitionProvider with ChangeNotifier {
  Map<String, dynamic> competitionData = {};

  getFromData({
    String? compName,
    String? compType,
    int? compAmount,
    String? gameName,
    String? gameType,
    int? fee,
    DateTime? applyStartDate,
    DateTime? applyEndDate,
    DateTime? compStartDate,
    DateTime? compEndDate,
    String? compDetail,
    String? compRule,
    int? prize,
    String? imageURL,
  }) {
    if (compName != null) {
      competitionData['compName'] = compName;
    }
    if (compType != null) {
      competitionData['compType'] = compType;
    }
    if (compAmount != null) {
      competitionData['compAmount'] = compAmount;
    }
    if (gameName != null) {
      competitionData['gameName'] = gameName;
    }
    if (gameType != null) {
      competitionData['gameType'] = gameType;
    }
    if (fee != null) {
      competitionData['fee'] = fee;
    }
    if (applyStartDate != null) {
      competitionData['applyStartDate'] = applyStartDate;
    }
    if (applyEndDate != null) {
      competitionData['applyEndDate'] = applyEndDate;
    }
    if (compStartDate != null) {
      competitionData['compStartDate'] = compStartDate;
    }
    if (compEndDate != null) {
      competitionData['compEndDate'] = compEndDate;
    }
    if (compDetail != null) {
      competitionData['compDetail'] = compDetail;
    }
    if (compRule != null) {
      competitionData['compRule'] = compRule;
    }
    if (prize != null) {
      competitionData['prize'] = prize;
    }
    if (imageURL != null) {
      competitionData['imageURL'] = imageURL;
    }
  }
}
