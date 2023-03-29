import 'package:flutter/foundation.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    if (kDebugMode) {
      print('Enter in saving sp');
      print(user.token);
    }
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('latitude', user.latitude.toString());
    sp.setString('userName', user.userName.toString());
    sp.setInt('id', user.id!);
    // print('sp savedddddd');

    // sp.setInt('isverified', user.isverified!);

    // sp.setInt('isSeller', user.isSeller!);

    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? latitude = sp.getString('latitude');
    final String? userName = sp.getString('userName');
    final int? id = sp.getInt('id');
    // final int? isSeller = sp.getInt('isSeller');
    // final int? isverified = sp.getInt('isverified');

    return UserModel(
      token: token.toString(),
      id: id,
      latitude: latitude,
      userName: userName,
      // isverified: isverified,

      // isSeller: isSeller,
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.remove('id');
    sp.remove('latitude');
    sp.remove('userName');

    // sp.remove('isverified');

    // sp.remove('isSeller');
    if (kDebugMode) {
      print('token removed');
    }
    return true;
  }
}
