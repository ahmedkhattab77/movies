import 'package:flutter/material.dart';

import '../../api/api_manger.dart';
import '../../model/Results.dart';

class DetailsViewModel extends ChangeNotifier {
  List<Results>? similar;
  String? erorMassage;
  bool? showLoding;

  Future<List<Results>?> getSimilar(int movie_id) async {
    showLoding = true;
    erorMassage = null;
    similar = null;
    notifyListeners();
    try {
      var responce = await ApiManger.getSimilar('$movie_id');
      showLoding = null;
      if (responce.status_message == 'error') {
        erorMassage = responce.status_message;
        return [];
      } else {
        similar = responce.results;
      }
    } catch (e) {
      showLoding = null;
      erorMassage = e.toString();
    }
    notifyListeners();
  }
}
