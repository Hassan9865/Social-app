// import 'package:social_app/view/chatList/ChatList_view.dart';
// import 'package:social_app/view/home/home_view.dart';
// import 'package:social_app/view/notification/notificate_view.dart';
// import 'package:social_app/view/profile/profile_view.dart';
// import 'package:stacked/stacked.dart';

// class BottombarViewModel extends IndexTrackingViewModel {
//    getViewForIndex(int index) {
//       switch (index) {
//         case 0:
//           return HomeView();
//         case 1:
//           return ProfileView();
//         case 2:
//           return ChatListView();
//         case 3:
//           return NotificationView();
//         default:
//           return HomeView();
//       }
//     }
// }

import 'package:flutter/material.dart';
import 'package:social_app/view/chatList/ChatList_view.dart';
import 'package:social_app/view/home/home_view.dart';
import 'package:social_app/view/notification/notificate_view.dart';
import 'package:social_app/view/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

class BottombarViewModel extends IndexTrackingViewModel {
  int unreadChats = 3; // Example data - replace with your actual logic
  int unreadNotifications = 7; // Example data - replace with your actual logic

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return ProfileView();
      case 2:
        return ChatListView();
      case 3:
        return NotificationView();
      default:
        return HomeView();
    }
  }

  // Add this if you need to update badge counts
  void updateBadgeCounts({int? chats, int? notifications}) {
    if (chats != null) unreadChats = chats;
    if (notifications != null) unreadNotifications = notifications;
    notifyListeners();
  }
}
