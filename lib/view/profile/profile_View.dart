import 'package:flutter/material.dart';
import 'package:social_app/view/profile/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.pink,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              centerTitle: true,
              backgroundColor: Colors.blueGrey[400],
              elevation: 0,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/images/pic3.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Hassan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Hassan"),
                          // subtitle: Text(""),
                        ),
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Email"),
                          subtitle: Text("hassan@gmail.com"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
