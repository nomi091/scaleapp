class GetNotificationsListModel {
  bool? status;
  String? message;
  List<Notifications>? notifications;

  GetNotificationsListModel({this.status, this.message, this.notifications});

  GetNotificationsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }
}

class Notifications {
  String? id;
  Data? data;
  bool? isRead;
  String? receivedAt;
  NotifyFrom? notifyFrom;

  Notifications(
      {this.id, this.data, this.isRead, this.receivedAt, this.notifyFrom});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isRead = json['is_read'];
    receivedAt = json['received_at'];
    notifyFrom = json['notify_from'] != null
        ? NotifyFrom.fromJson(json['notify_from'])
        : null;
  }
}

class Data {
  String? text;
  String? redirectTo;

  Data({this.text, this.redirectTo});

  Data.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    redirectTo = json['redirect_to'];
  }
}

class NotifyFrom {
  int? id;
  String? name;
  String? profileImage;

  NotifyFrom({this.id, this.name, this.profileImage});

  NotifyFrom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profile_image'];
  }
}