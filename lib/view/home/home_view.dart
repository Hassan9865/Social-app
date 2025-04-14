import 'package:flutter/material.dart';
import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:social_app/view/home/widget/buildAddStoryButton.dart';
import 'package:social_app/view/home/widget/buildPostCard.dart';
import 'package:social_app/view/home/widget/buildStoryCircle.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor:
              viewModel.isDarkTheme ? Colors.grey[900] : Colors.grey[50],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Social App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: viewModel.isDarkTheme ? Colors.white : Colors.white,
              ),
            ),
            backgroundColor:
                viewModel.isDarkTheme ? Colors.black87 : Colors.blueGrey[700],
            elevation: 0,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  viewModel.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                  color: viewModel.isDarkTheme ? Colors.white : Colors.white,
                ),
                onPressed: viewModel.toggletheme,
              ),
              IconButton(
                onPressed: () {
                  viewModel.navigateToNotification();
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color: viewModel.isDarkTheme ? Colors.white : Colors.white,
                ),
                tooltip: 'Notifications',
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: circlelist.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Buildaddstorybutton(index);
                        }
                        final storyIndex = index - 1;
                        return Buildstorycircle(storyIndex);
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Buildpostcard(index);
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blueGrey[700],
            child: Icon(Icons.add, color: Colors.white),
            elevation: 2,
          ),
        );
      },
    );
  }
}
