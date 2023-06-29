import 'package:flutter/widgets.dart';

class CompetitionProvider with ChangeNotifier{
  Map<String, dynamic> competitionData = {};

  getFromData({required String compName}){
    if (compName != null) {
      competitionData['compName'] = compName;
    }
  }
}