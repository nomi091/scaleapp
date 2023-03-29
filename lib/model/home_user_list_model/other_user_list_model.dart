class UserDataListModel {
  bool? status;
  String? message;
  String? rank;
  List<Users>? users;

  UserDataListModel({this.status, this.message, this.rank, this.users});

  UserDataListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    rank = json['rank'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }
}

class Users {
  int? id;
  String? name;
  String? gender;
  String? email;
  bool? hasGallery;
  // int? age;
  String? about;
  String? profileImage;
  double? distance;
  bool? isLikedByMe;
  int? likes;
  String? rank;
  var rankNumber;
  Filter? filter;

  Users(
      {this.id,
      this.name,
      this.gender,
      this.email,
      this.hasGallery,
      // this.age,
      this.about,
      this.profileImage,
      this.distance,
      this.isLikedByMe,
      this.likes,
      this.rank,
      this.rankNumber,
      this.filter});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    hasGallery = json['has_gallery'];
    // age = json['age'];
    about = json['about'];
    profileImage = json['profile_image'];
    distance = json['distance'].toDouble();
    isLikedByMe = json['is_liked_by_me'];
    likes = json['likes'];
    rank = json['rank'];
    rankNumber = json['rank_number'];
    filter = json['filter'] != null ? Filter.fromJson(json['filter']) : null;
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
