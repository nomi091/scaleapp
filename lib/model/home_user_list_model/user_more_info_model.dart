// ignore_for_file: prefer_typing_uninitialized_variables

class OtherUserMoreInfoModel {
  bool? status;
  String? message;
  Users? users;

  OtherUserMoreInfoModel({this.status, this.message, this.users});

  OtherUserMoreInfoModel.fromJson(Map<String, dynamic> json) {
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

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'] ?? 0;
    email = json['email'];
    rank = json['rank'];
    rankNumber = json['rank_number'];
    dob = json['dob'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
    agreeTermsConditions = json['agree_terms_conditions'];
    agreeUserChoices = json['agree_user_choices'];
    agreeToAllowAppPermissionAccess =
        json['agree_to_allow_app_permission_access'];
    about = json['about'] ?? 'I’m just me ';
    profileImage = json['profile_image'];
    // blockedAt = json['blocked_at'];
    isLikedByMe = json['is_liked_by_me'];
    likes = json['likes'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    filter = json['filter'] != null ? Filter.fromJson(json['filter']) : null;
    matchPreference = json['matchPreference'] != null
        ? MatchPreference.fromJson(json['matchPreference'])
        : null;
  }
}

class Images {
  int? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
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

  Filter.fromJson(Map<String, dynamic> json) {
    /// will be replaced
    
    isProfileRanked = json['is_profile_ranked'];
    profilePreference = json['profile_preference'];
    isShowRank = json['is_show_rank'];
  }
}

class MatchPreference {
  List<String>? ageRange;
  String? gender;
  int? distance;
  int? isPocket;

  MatchPreference({this.ageRange, this.gender, this.distance,this.isPocket,});

  MatchPreference.fromJson(Map<String, dynamic> json) {
    ageRange = json['age_range'].cast<String>();
    gender = json['gender'];
    distance = json['distance'];
    isPocket = json['is_pocket'];
  }
}
