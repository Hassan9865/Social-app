import 'package:flutter/material.dart';
import 'package:social_app/view/bottom_bar/bottom_ViewModel.dart';
import 'package:social_app/view/chatList/ChatList_view.dart';
import 'package:social_app/view/home/home_view.dart';
import 'package:social_app/view/notification/notificate_view.dart';
import 'package:social_app/view/profile/profile_View.dart';
import 'package:stacked/stacked.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
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

    // int myindex = 0;
    // List<Widget> widgetList = [
    //   HomeView(),
    //   ProfileView(),
    //   Contactview(),
    //   NotificationView(),
    // ];
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => BottombarViewModel(),
        builder: (context, ViewModel, child) {
          return Scaffold(
            body: getViewForIndex(ViewModel.currentIndex), //IndexedStack(
            //   children: widgetList,
            //   index: myindex,
            // ),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0xFF084A76),
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.grey[500],
                type: BottomNavigationBarType.fixed,
                onTap: ViewModel.setIndex, // (index) {
                //   // setState(() {
                //   //   myindex = index;
                //   // });
                // },
                currentIndex: ViewModel.currentIndex, //myindex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                      backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_pin_rounded,
                      ),
                      label: "Profile",
                      backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.yellow,
                    icon: Icon(Icons.chat),
                    label: "Chat",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notification_important),
                    label: "Notification",
                    backgroundColor: Colors.yellow,
                  ),
                ]),
          );
        });
  }
}
