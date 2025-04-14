import 'package:flutter/material.dart';
import 'package:social_app/view/profile/profile_viewModel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
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
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/images/pic3.jpg"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Hassan",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "@hassan_dev",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (context, constraints) {
                  double containerWidth = constraints.maxWidth / 3 - 12;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatContainer(
                          context, "1.2k", "Posts", containerWidth),
                      _buildStatContainer(
                          context, "12.4k", "Followers", containerWidth),
                      _buildStatContainer(
                          context, "563", "Following", containerWidth),
                    ],
                  );
                }),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        _buildProfileTile(
                          icon: Icons.person_outline,
                          title: "About Me",
                          subtitle:
                              "Flutter Developer | Open Source Contributor",
                        ),
                        _buildProfileTile(
                          icon: Icons.email_outlined,
                          title: "Email",
                          subtitle: "hassan@gmail.com",
                        ),
                        _buildProfileTile(
                          icon: Icons.phone_android_outlined,
                          title: "Phone",
                          subtitle: "+92 300 1234567",
                        ),
                        _buildProfileTile(
                          icon: Icons.location_on_outlined,
                          title: "Location",
                          subtitle: "Lahore, Pakistan",
                        ),
                        _buildProfileTile(
                          icon: Icons.people_outline,
                          title: "Friends",
                          subtitle: "1,243 connections",
                          trailing: Chip(
                            label: Text("New"),
                            backgroundColor: Colors.blue[50],
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                        _buildProfileTile(
                          icon: Icons.work_outline,
                          title: "Occupation",
                          subtitle: "Mobile App Developer",
                        ),
                        _buildProfileTile(
                          icon: Icons.calendar_today_outlined,
                          title: "Joined",
                          subtitle: "January 2022",
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Edit Profile"),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatContainer(
      BuildContext context, String value, String label, double width) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.blueGrey[700]),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: trailing,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      onTap: () {},
    );
  }
}
