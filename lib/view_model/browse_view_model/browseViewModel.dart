import 'package:flutter/material.dart';

import '../../api/api_manger.dart';
import '../../model/browse/Genres.dart';

class BrowseViewModel extends ChangeNotifier {
  List<Genres>? browseList;
  String? erorMassage;
  bool? showLoding;

  getAllGenerate() async {
    showLoding = true;
    erorMassage = null;
    browseList = null;
    notifyListeners();
    try {
      var responce = await ApiManger.getBrowse();
      showLoding = null;
      if (responce.status_message == 'error') {
        return erorMassage = responce.status_message;
      } else {
        browseList = responce.genres;
      }
    } catch (e) {
      showLoding = null;
      erorMassage = e.toString();
    }
    notifyListeners();
  }
}
