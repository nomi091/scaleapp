// ignore_for_file: prefer_typing_uninitialized_variables

class UserInfoProfileModel {
  bool? status;
  String? message;
  Users? users;

  UserInfoProfileModel({this.status, this.message, this.users});

  UserInfoProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }
}

class Users {
  int? id;
  String? name;
  String? gender;
  int? age;
  String? email;
  String? rank;
  int? rankNumber;
  String? dob;
  String? latitude;
  String? longitude;
  var distance;
  int? agreeTermsConditions;
  int? agreeUserChoices;
  int? agreeToAllowAppPermissionAccess;
  String? about;
  String? profileImage;
  // Null? blockedAt;
  bool? isLikedByMe;
  int? likes;
  List<Images>? images;
  Filter? filter;
  MatchPreference? matchPreference;

  Users(
      {this.id,
      this.name,
      this.gender,
      this.age,
      this.email,
      this.rank,
      this.rankNumber,
      this.dob,
      this.latitude,
      this.longitude,
      this.distance,
      this.agreeTermsConditions,
      this.agreeUserChoices,
      this.agreeToAllowAppPermissionAccess,
      this.about,
      this.profileImage,
      // this.blockedAt,
      this.isLikedByMe,
      this.likes,
      this.images,
      this.filter,
      this.matchPreference});

  factory Users.fromJson(json) {
    int? id = json['id'] ?? 0;
    String? name = json['name'] ?? '';
    String? gender = json['gender'] ?? '';
    int? age = json['age'] ?? 0;
    String? email = json['email'] ?? '';
    String? rank = json['rank'] ?? '';
    int? rankNumber = json['rank_number'];
    String? dob = json['dob'] ?? '';
    String? latitude = json['latitude'] ?? '';
    String? longitude = json['longitude'] ?? '';
    var distance = json['distance'] ?? 0;
    int? agreeTermsConditions = json['agree_terms_conditions'] ?? 0;
    int? agreeUserChoices = json['agree_user_choices'] ?? 0;
    int? agreeToAllowAppPermissionAccess =
        json['agree_to_allow_app_permission_access'] ?? 0;
    String? about = json['about'] ?? '';
    String? profileImage = json['profile_image'];
    // blockedAt = json['blocked_at'];
    bool? isLikedByMe = json['is_liked_by_me'];
    int? likes = json['likes'] ?? 0;
    List<Images>? images = [];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    Filter? filter =
        json['filter'] != null ? Filter.fromJson(json['filter']) : null;
    MatchPreference? matchPreference = json['matchPreference'] != null
        ? MatchPreference.fromJson(json['matchPreference'])
        : null;

    return Users(
      id: id,
      name: name,
      gender: gender,
      age: age,
      email: email,
      rank: rank,
      rankNumber: rankNumber,
      dob: dob,
      latitude: latitude,
      longitude: longitude,
      distance: distance,
      agreeTermsConditions: agreeTermsConditions,
      agreeUserChoices: agreeUserChoices,
      agreeToAllowAppPermissionAccess: agreeToAllowAppPermissionAccess,
      about: about,
      profileImage: profileImage,
      isLikedByMe: isLikedByMe,
      likes: likes,
      images: images,
      filter: filter,
      matchPreference: matchPreference,
    );
  }
}

class Images {
  int? id;
  String? url;

  Images({this.id, this.url});

  factory Images.fromJson(Map<String, dynamic> json) {
    int? id = json['id'] ?? 0;
    String? url = json['url'] ?? '';
    return Images(id: id, url: url);
  }
}

class Filter {
  
  int? isProfileRanked;
  String? profilePreference;
  int? isShowRank;

  Filter(
      {
      this.isProfileRanked,
      this.profilePreference,
      this.isShowRank});

  factory Filter.fromJson(Map<String, dynamic> json) {
    /// will be replaced
    
    int? isProfileRanked = json['is_profile_ranked'] ?? 0;
    String? profilePreference = json['profile_preference'] ?? '';
    int? isShowRank = json['is_show_rank'] ?? 0;
    return Filter(
        
        isProfileRanked: isProfileRanked,
        profilePreference: profilePreference,
        isShowRank: isShowRank);
  }
}

class MatchPreference {
  List<dynamic>? ageRange;
  String? gender;
  int? distance;
  int? isPocket;

  MatchPreference({this.ageRange, this.gender, this.distance,this.isPocket,});

  factory MatchPreference.fromJson(json) {
    List<dynamic>? ageRange = json['age_range'].cast<String>();
    String? gender = json['gender'] ?? '';
    int? distance = json['distance'] ?? '';
    int? isPocket = json['is_pocket'] ?? 0;
    return MatchPreference(
      ageRange: ageRange,
      gender: gender,
      distance: distance,
      isPocket: isPocket,
    );
  }
}
