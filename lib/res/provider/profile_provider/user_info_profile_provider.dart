import 'package:flutter/cupertino.dart';
import 'package:scaleapp/model/user_model/user_info_model.dart';

class UserProfileProvider extends ChangeNotifier {
  Users _users = Users(
    id: 0,
    name: 'null',
    gender: 'null',
    age: 0,
    email: 'null',
    rank: 'null',
    rankNumber: 0,
    dob: 'null',
    latitude: 'null',
    longitude: 'null',
    distance: 0,
    agreeTermsConditions: 0,
    agreeUserChoices: 0,
    agreeToAllowAppPermissionAccess: 0,
    about: 'null',
    profileImage: null,
    isLikedByMe: null,
    likes: 0,
  );

  ///

  ///
  Filter _filter = Filter(
    isProfileRanked: 3,
    profilePreference: '',
    isShowRank: 3,
  );

  ///
  MatchPreference _preference = MatchPreference(
    ageRange: [],
    gender: '',
    distance: 0,
    isPocket: 3,
  );

  ////////////// Getter //////////////////

  Users get userdata => _users;
  Filter get filter => _filter;
  MatchPreference get prefrence => _preference;

  set user(Users value) {
    _users = value;
    notifyListeners();
  }

  set filterinfo(Filter value) {
    // debugPrint('set filter val in Provider');
    // debugPrint('${_filter.isShowRank}');
    _filter = value;
    notifyListeners();
    // debugPrint('_filter.isShowRank}');
    // debugPrint('${_filter.isShowRank}');
  }

  set preference(MatchPreference value) {
    _preference = value;
    // debugPrint('prefrence.ageRange.toString()');
    // debugPrint('prefrence.ageRange.toString()');
    // debugPrint(prefrence.ageRange!.length.toString());
    // debugPrint(prefrence.ageRange![0].toString());
    // debugPrint(prefrence.ageRange![1].toString());
    // debugPrint('prefrence.isPocket.toString()');
    // debugPrint(prefrence.isPocket.toString());

    // debugPrint('prefrence.ageRange.toString()');

    notifyListeners();
  }

  void clearUserProfileProvider() {
    debugPrint('in clearUserProfileProvider');
    _users = Users(
        id: 0,
        name: '',
        gender: '',
        age: 0,
        email: '',
        rank: '',
        rankNumber: 0,
        dob: '',
        latitude: '',
        longitude: '',
        distance: 0.0,
        agreeTermsConditions: 0,
        agreeUserChoices: 0,
        agreeToAllowAppPermissionAccess: 0,
        about: '',
        profileImage: null,
        isLikedByMe: null,
        likes: 0);

    _filter = Filter(
      isProfileRanked: 0,
      profilePreference: '',
      isShowRank: 0,
    );
    _preference = MatchPreference(
      ageRange: [],
      gender: '',
      distance: 0,
      isPocket: 0,
    );
    // debugPrint('done clearUserProfileProvider');
  }
}
