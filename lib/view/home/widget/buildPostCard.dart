import 'package:flutter/material.dart';
import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:social_app/view/home/widget/buildPostActionButton.dart';
import 'package:stacked/stacked.dart';

class Buildpostcard extends ViewModelWidget<HomeViewModel> {
  final int index;

  const Buildpostcard(
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: viewModel.isDarkTheme ? Colors.grey[850] : Colors.white,
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
                          color: viewModel.isDarkTheme
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "1 hour ago • Public",
                        style: TextStyle(
                          color: viewModel.isDarkTheme
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: viewModel.isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "The picture is amazing. This is a sample post content that can be longer than one line.",
              style: TextStyle(
                fontSize: 14,
                color: viewModel.isDarkTheme ? Colors.white : Colors.black,
              ),
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
                Text("230",
                    style: TextStyle(
                      color: viewModel.isDarkTheme ? Colors.white : Colors.grey,
                    )),
                SizedBox(width: 15),
                Icon(Icons.comment,
                    color: viewModel.isDarkTheme ? Colors.white : Colors.grey,
                    size: 18),
                SizedBox(width: 4),
                Text("56",
                    style: TextStyle(
                      color: viewModel.isDarkTheme ? Colors.white : Colors.grey,
                    )),
                Spacer(),
                Text("1.2k shares",
                    style: TextStyle(
                      color: viewModel.isDarkTheme ? Colors.white : Colors.grey,
                    )),
              ],
            ),
            Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildPostActionButton(
                    icon: Icons.thumb_up_alt_rounded, label: "Like"),
                BuildPostActionButton(
                    icon: Icons.comment_outlined, label: "Comment"),
                BuildPostActionButton(
                    icon: Icons.share_outlined, label: "Share")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
