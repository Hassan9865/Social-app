import 'package:flutter/material.dart';
import 'package:social_app/List_data/notificationList.dart';
import 'package:social_app/view/notification/notification-view_model.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NotificationViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              backgroundColor: Colors.blueGrey[300],
              elevation: 0,
            ),
            body: ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(notificationList[index].image),
                    ),
                    title: Text(notificationList[index].title),
                    subtitle: Text(
                      notificationList[index].subtitle,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text("12:00  am"),
                  );
                }),
          );
        });
  }
}
