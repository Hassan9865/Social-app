import 'package:flutter/material.dart';
import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Social App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blueGrey[700],
            elevation: 0,
            centerTitle: true,
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.search, color: Colors.white),
            //     tooltip: 'Search',
            //   ),
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.notifications_outlined, color: Colors.white),
            //     tooltip: 'Notifications',
            //   ),
            // ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _buildStoriesSection(viewModel, context),
                  _buildPostsList(context, screenHeight),
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

  Widget _buildStoriesSection(HomeViewModel viewModel, BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: circlelist.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStoryButton();
          }
          // final storyIndex = index - 1;
          return _buildStoryCircle(viewModel, context, index);
        },
      ),
    );
  }

  Widget _buildAddStoryButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey[300]!, width: 2),
            ),
            child: Icon(Icons.add, size: 30, color: Colors.blueGrey[700]),
          ),
          SizedBox(height: 5),
          Text("Your Story", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildStoryCircle(
      HomeViewModel viewModel, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              viewModel.navigateToStoryview(
                  circlelist[index].image, circlelist[index].title);
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(circlelist[index].image),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 70,
            child: Text(
              circlelist[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsList(BuildContext context, double screenHeight) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildPostCard(context, index, screenHeight);
      },
    );
  }

  Widget _buildPostCard(BuildContext context, int index, double screenHeight) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(circlelist[index].image),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        circlelist[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "1 hour ago • Public",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "The picture is amazing. This is a sample post content that can be longer than one line.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
            Container(
              height: screenHeight * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/post.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 18),
                SizedBox(width: 4),
                Text("230", style: TextStyle(color: Colors.grey)),
                SizedBox(width: 15),
                Icon(Icons.comment, color: Colors.grey, size: 18),
                SizedBox(width: 4),
                Text("56", style: TextStyle(color: Colors.grey)),
                Spacer(),
                Text("1.2k shares", style: TextStyle(color: Colors.grey)),
              ],
            ),
            Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPostActionButton(Icons.thumb_up_outlined, "Like"),
                _buildPostActionButton(Icons.comment_outlined, "Comment"),
                _buildPostActionButton(Icons.share_outlined, "Share"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.blueGrey),
      label: Text(label, style: TextStyle(color: Colors.blueGrey)),
      style: TextButton.styleFrom(
        minimumSize: Size(0, 40),
      ),
    );
  }
}
