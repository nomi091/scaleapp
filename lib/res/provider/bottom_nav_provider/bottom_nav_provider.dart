// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class BottomNavProvider with ChangeNotifier {
  int _count = 0;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  int get count => _count;

  void setindex(int index) {
    // debugPrint('Index $_currentIndex');
    _currentIndex = index;
    notifyListeners();
  }

  void setCount(int val) {
    // debugPrint('Index $_currentIndex');
    _count = val;
    // notifyListeners();
  }

  void newindex() {
    _currentIndex = 0;
    notifyListeners();
  }
}
