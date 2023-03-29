// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double _rankValue = 1.0;
  double get rankValue => _rankValue;

  ///
  final List<int> _rankList = [];
  List get rankList => _rankList;

  ///

  void setSliderVal(double sliderval) {
    // debugPrint('Index $_currentIndex');
    _rankValue = sliderval;
    notifyListeners();
  }

  void setSliderListIndexVal(double sliderval, int passindex) {
    // debugPrint('Index $_currentIndex');
    // _rankList.insert(passindex, sliderval.round());
    _rankList[passindex] = sliderval.round();
    notifyListeners();
  }

  void setInitialRankList(listLength) {
    for (int i = 0; i < listLength; i++) {
      _rankList.add(1);
    }
    if (kDebugMode) {
      // print('Finally List Is created ${rankList.length.toString()}');
    }
    // notifyListeners();
  }

  void clearRankList() {
    rankList.clear();
    if (kDebugMode) {
      // print('Finally List Is clear ${rankList.length.toString()}');
    }
    // notifyListeners();
  }
}
