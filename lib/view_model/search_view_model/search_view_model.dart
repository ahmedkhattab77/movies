import 'package:flutter/foundation.dart';

import '../../api/api_manger.dart';
import '../../model/Results.dart';

class SearchViewModel extends ChangeNotifier {
  List<Results>? newsList;
  String? erorMassage;
  bool? showLoding;

  getSearch(String search) async {
    showLoding = true;
    erorMassage = null;
    newsList = null;
    notifyListeners();
    try {
      var responce = await ApiManger.getSearch(search);
      showLoding = null;
      if (responce.status_message == 'error') {
        return erorMassage = responce.status_message;
      } else {
        newsList = responce.results;
      }
    } catch (e) {
      showLoding = null;
      erorMassage = e.toString();
    }
    notifyListeners();
  }
}
