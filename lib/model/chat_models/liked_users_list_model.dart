class LikedUsersIDS {
  bool? status;
  String? message;
  List<int>? ids;

  LikedUsersIDS({this.status, this.message, this.ids});

  LikedUsersIDS.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    ids = json['ids'].cast<int>();
  }
}