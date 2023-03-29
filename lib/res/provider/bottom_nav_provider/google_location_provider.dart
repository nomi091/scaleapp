import 'package:flutter/foundation.dart';

class GooglemapGetAddressProvider with ChangeNotifier {
  String? _city;
  String? _country;
  String? _streetaddress;
  String? _postalcode;

  String? get city => _city;
  String? get country => _country;
  String? get streetaddress => _streetaddress;
  String? get postalcode => _postalcode;

  void setAddress({
    String? passcity,
    String? passcountry,
    String? passstreetaddress,
    String? passpostalcode,
    bool? passsetinitial,
  }) {
    if (kDebugMode) {
      print(
          'In provider nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      print(passcity);
      print(passcountry);
      print(passstreetaddress);
      print(passpostalcode);
      print(
          'In provider hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    }
    _city = passcity;
    _country = passcountry;
    _streetaddress = passstreetaddress;
    _postalcode = passpostalcode;
    notifyListeners();
  }
}
