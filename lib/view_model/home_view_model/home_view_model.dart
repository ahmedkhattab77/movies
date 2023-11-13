import 'package:flutter/material.dart';
import 'package:movies/model/Results.dart';

import '../../api/api_manger.dart';

class HomeViewModel extends ChangeNotifier {
  List<Results>? popular;
  List<Results>? topRate;
  List<Results>? upcoming;
  String? erorMassage;
  bool? showLoding;

  getAllPopular() async {
    showLoding = true;
    erorMassage = null;
    popular = null;
    notifyListeners();
    try {
      print(" ahmed ");

      var responce = await ApiManger.getPopular();
      print(" ahmed ${responce.results}");

      showLoding = false;
      if (responce.status_message == 'error') {
        return erorMassage = responce.status_message;
      } else {
        popular = responce.results;
        print(" ahmed ${responce.results}");
      }
    } catch (e) {
      showLoding = null;
      erorMassage = e.toString();
    }
    notifyListeners();
  }

  getAllTopRater() async {
    showLoding = true;
    erorMassage = null;
    topRate = null;
    notifyListeners();
    try {
      var responce = await ApiManger.getTopRate();
      showLoding = null;
      if (responce.status_message == 'error') {
        return erorMassage = responce.status_message;
      } else {
        topRate = responce.results;
      }
    } catch (e) {
      showLoding = null;
      erorMassage = e.toString();
    }
    notifyListeners();
  }

  getAllUpcoming() async {
    showLoding = true;
    erorMassage = null;
    upcoming = null;
    notifyListeners();
    try {
      var responce = await ApiManger.getUpcoming();
      showLoding = null;
      if (responce.status_message == 'error') {
        return erorMassage = responce.status_message;
      } else {
        upcoming = responce.results;
      }
    } catch (e) {
      showLoding = null;
      erorMassage = e.toString();
    }
    notifyListeners();
  }
}
