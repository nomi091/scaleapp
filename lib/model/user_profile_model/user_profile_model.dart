class UserProfileModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? gender;
  String? mobile;
  String? rank;
  int? status;
  int? roleId;
  int? isAdmin;
  int? isSeller;
  int? isTempPassword;
  int? isBanned;
  int? isDeleted;
  int? isVerified;
  
  // String? createdAt;
  // String? updatedAt;
  String? lastSeen;
  int? follower;
  int? following;
  int? collection;

  UserProfileModel(
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.mobile,
    this.rank,
    this.status,
    this.roleId,
    this.isAdmin,
    this.isSeller,
    this.isTempPassword,
    this.isBanned,
    this.isDeleted,
    this.isVerified,
    // this.createdAt,
    // this.updatedAt,
    this.lastSeen,
    this.follower,
    this.following,
    this.collection,
  );

  factory UserProfileModel.fromJson(json) {
    int id = json['id'] ?? 0;
    String name = json['name'] ?? '';
    String email = json['email'] ?? '';
    String emailVerifiedAt = json['email_verified_at'] ?? '';
    String gender = json['gender'] ?? '';
    String mobile = json['mobile'] ?? '';
    String rank = json['rank'] ?? '';
    int status = json['status'] ?? 0;
    int roleId = json['role_id'] ?? 0;
    int isAdmin = json['is_admin'] ?? 0;
    int isSeller = json['is_seller'];
    int isTempPassword = json['is_temp_password'] ?? 0;
    int isBanned = json['is_banned'] ?? 0;
    int isDeleted = json['is_deleted'] ?? 0;
    int isVerified = json['is_verified'];
    
    // var createdAt = json['created_at'];
    // var updatedAt = json['updated_at'];
    String lastSeen = json['last_seen'] ?? '';
    int follower = json['follower'] ?? 0;
    int following = json['following'] ?? 0;
    int collection = json['collection'] ?? 0;

    return UserProfileModel(
        id,
        name,
        email,
        emailVerifiedAt,
        gender,
        mobile,
        rank,
        status,
        roleId,
        isAdmin,
        isSeller,
        isTempPassword,
        isBanned,
        isDeleted,
        isVerified,
        
        lastSeen,
        follower,
        following,
        collection);
  }
}

class AccountDetailModel {
  int? id;
  int? userId;
  String? description;
  String? profileImage;
  String? coverImage;
  String? tagline;
  String? type;

  AccountDetailModel(
    this.id,
    this.userId,
    this.description,
    this.profileImage,
    this.coverImage,
    this.tagline,
    this.type,
  );

  factory AccountDetailModel.fromJson(json) {
    int id = json['id'] ?? 0;
    int userId = json['user_id'] ?? 0;
    String description = json['description'] ?? '';
    String profileImage = json['profile_image'] ?? '';
    String coverImage = json['cover_image'] ?? '';
    String tagline = json['tagline'] ?? '';
    String type = json['type'] ?? '';
    return AccountDetailModel(
        id, userId, description, profileImage, coverImage, tagline, type);
  }
}

class RoleModel {
  int? id;
  String? name;

  RoleModel(
    this.id,
    this.name,
  );

  factory RoleModel.fromJson(json) {
    int id = json['id'] ?? 0;
    String name = json['name'] ?? '';
    return RoleModel(id, name);
  }
}
