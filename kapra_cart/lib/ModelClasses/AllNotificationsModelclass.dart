// To parse this JSON data, do
//
//     final getNotification = getNotificationFromJson(jsonString);

import 'dart:convert';

List<GetNotification> getNotificationFromJson(String str) =>
    List<GetNotification>.from(
        json.decode(str).map((x) => GetNotification.fromJson(x)));

String getNotificationToJson(List<GetNotification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetNotification {
  GetNotification({
    this.nId,
    this.notifications,
  });

  String nId;
  String notifications;

  factory GetNotification.fromJson(Map<String, dynamic> json) =>
      GetNotification(
        nId: json["n_id"],
        notifications: json["notifications"],
      );

  Map<String, dynamic> toJson() => {
        "n_id": nId,
        "notifications": notifications,
      };
}
