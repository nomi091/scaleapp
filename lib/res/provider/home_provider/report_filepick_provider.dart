// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

class ReportFilePickprovider with ChangeNotifier {
  var _fileone;
  List _fileListPaths = [];

  get fileone => _fileone;
  get fileListPaths => _fileListPaths;

  void setFile({
    var passfile,
  }) {
    _fileone = passfile;

    notifyListeners();
  }

  void setNullFile() {
    _fileone = null;
    debugPrint(_fileone.toString());
  }
  
  void setListtoNull() {
    _fileListPaths.clear();
    debugPrint(_fileone.toString());
  }
}
