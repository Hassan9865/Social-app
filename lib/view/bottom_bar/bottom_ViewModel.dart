import 'package:social_app/view/chatList/ChatList_view.dart';
import 'package:social_app/view/home/home_view.dart';
import 'package:social_app/view/notification/notificate_view.dart';
import 'package:social_app/view/profile/profile_View.dart';
import 'package:stacked/stacked.dart';

class BottombarViewModel extends IndexTrackingViewModel {
   getViewForIndex(int index) {
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
}
