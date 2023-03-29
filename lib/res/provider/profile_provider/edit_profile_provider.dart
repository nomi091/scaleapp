// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class MatchPrefrencesProvider with ChangeNotifier {
  bool _blur = false;
  bool get blur => _blur;

  void setblur() {
    // debugPrint('Index $_currentIndex');
    _blur = !_blur;
    notifyListeners();
  }

  void setblurAfter() {
    _blur = false;
  }
}
