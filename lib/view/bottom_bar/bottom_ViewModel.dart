import 'package:flutter/material.dart';
import 'package:social_app/view/chatList/ChatList_view.dart';
import 'package:social_app/view/find%20friends/findFriend_view.dart';
import 'package:social_app/view/home/home_view.dart';
import 'package:social_app/view/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

class BottombarViewModel extends IndexTrackingViewModel {
  int unreadChats = 3;
  int unreadFriends = 7;

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return ProfileView();
      case 2:
        return ChatListView();
      case 3:
        return FindFriendview();
      default:
        return HomeView();
    }
  }

  void updateBadgeCounts({int? chats, int? Friends}) {
    if (chats != null) unreadChats = chats;
    if (Friends != null) unreadFriends = Friends;
    notifyListeners();
  }
}
