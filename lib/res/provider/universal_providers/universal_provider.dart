// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class UniversalProvider with ChangeNotifier {
  bool _storedataonFireBase = false;
  bool get storedataonFireBase => _storedataonFireBase;

  void setStoredataonFireBase(bool value) {
    debugPrint('setStoredataonFireBase $value');
    _storedataonFireBase = value;
    debugPrint('setStoredataonFireBase $value');
    
    
  }
}
