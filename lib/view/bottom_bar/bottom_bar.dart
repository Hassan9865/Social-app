// import 'package:flutter/material.dart';
// import 'package:social_app/view/bottom_bar/bottom_ViewModel.dart';

// import 'package:stacked/stacked.dart';

// class Bottombar extends StatelessWidget {
//   const Bottombar({super.key});

//   @override
//   Widget build(BuildContext context) {

//     // int myindex = 0;
//     // List<Widget> widgetList = [
//     //   HomeView(),
//     //   ProfileView(),
//     //   Contactview(),
//     //   NotificationView(),
//     // ];
//     return ViewModelBuilder.reactive(
//         viewModelBuilder: () => BottombarViewModel(),
//         builder: (context, ViewModel, child) {
//           return Scaffold(
//             body: ViewModel.getViewForIndex(ViewModel.currentIndex), //IndexedStack(
//             //   children: widgetList,
//             //   index: myindex,
//             // ),
//             bottomNavigationBar: BottomNavigationBar(
//                 backgroundColor: const Color(0xFF084A76),
//                 unselectedItemColor: Colors.white,
//                 selectedItemColor: Colors.grey[500],
//                 type: BottomNavigationBarType.fixed,
//                 onTap: ViewModel.setIndex, // (index) {
//                 //   // setState(() {
//                 //   //   myindex = index;
//                 //   // });
//                 // },
//                 currentIndex: ViewModel.currentIndex, //myindex,
//                 items: const [
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.home),
//                       label: "Home",
//                       backgroundColor: Colors.amber),
//                   BottomNavigationBarItem(
//                       icon: Icon(
//                         Icons.person_pin_rounded,
//                       ),
//                       label: "Profile",
//                       backgroundColor: Colors.amber),
//                   BottomNavigationBarItem(
//                     backgroundColor: Colors.yellow,
//                     icon: Icon(Icons.chat),
//                     label: "Chat",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.notification_important),
//                     label: "Notification",
//                     backgroundColor: Colors.yellow,
//                   ),
//                 ]),
//           );
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:social_app/view/bottom_bar/bottom_ViewModel.dart';
import 'package:stacked/stacked.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottombarViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: viewModel.getViewForIndex(viewModel.currentIndex),
          bottomNavigationBar: _buildModernNavBar(viewModel),
        );
      },
    );
  }

  Widget _buildModernNavBar(BottombarViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF084A76), Color(0xFF042A46)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          items: [
            _buildNavItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home_rounded,
              label: "Home",
              hasNotification: false,
            ),
            _buildNavItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person_rounded,
              label: "Profile",
              hasNotification: false,
            ),
            _buildNavItem(
              icon: Icons.chat_bubble_outline,
              activeIcon: Icons.chat_rounded,
              label: "Chat",
              hasNotification: viewModel.unreadChats > 0,
              notificationCount: viewModel.unreadChats,
            ),
            _buildNavItem(
              icon: Icons.notifications_outlined,
              activeIcon: Icons.notifications_rounded,
              label: "Alerts",
              hasNotification: viewModel.unreadNotifications > 0,
              notificationCount: viewModel.unreadNotifications,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    bool hasNotification = false,
    int notificationCount = 0,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, size: 26),
          if (hasNotification)
            Positioned(
              right: -5,
              top: -3,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Center(
                  child: Text(
                    notificationCount > 9 ? '9+' : '$notificationCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
      activeIcon: Icon(activeIcon, size: 26),
      label: label,
    );
  }
}
