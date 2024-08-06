import 'dart:convert';

import 'package:apni_property_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helper/dialogs/loading_dialog.dart';

class NotificationClientID{
  notificationByClientID(token, clientID) async{
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Product/GetNotificationbyClientId?ClientId=$clientID',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      AppConstants.getNoficationByClientID = response.data['data'];
      AppConstants.getCountUnread = AppConstants.getNoficationByClientID.where((notification) => notification['isRead'] == false).length;
    }
    else {
      print(response.statusMessage);
    }
  }

  GetyNotificationByNID(token, NID, clientID) async{
    isLoadingDataNotifcation = true;
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Product/GetNotificationByNotificationId?NId=$NID&clientId=$clientID',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      isLoadingDataNotifcation = false;
    }
    else {
      print(response.statusMessage);
      isLoadingDataNotifcation = false;
    }
  }
}

// Assuming Notification is a model class for your notifications
class Notification {
  String id;
  String title;
  String body;
  bool isRead;

  Notification({required this.id, required this.title, required this.body, this.isRead = false});

  // Add a method to copy the Notification with updated read status
  Notification copyWith({bool? isRead}) {
    return Notification(
      id: id,
      title: title,
      body: body,
      isRead: isRead ?? this.isRead,
    );
  }
}

// Define a StateNotifier for managing notifications
class NotificationStateNotifier extends StateNotifier<List<Notification>> {
  NotificationStateNotifier() : super([]);

  // Function to update a notification as read
  void updateNotificationAsRead(String notificationID) {
    state = [
      for (final notification in state)
        if (notification.id == notificationID)
          notification.copyWith(isRead: true)
        else
          notification,
    ];
  }
}

// Define a provider for the StateNotifier
final myNoficationByClientID = StateNotifierProvider<NotificationStateNotifier, List<Notification>>((ref) {
  return NotificationStateNotifier();
});
