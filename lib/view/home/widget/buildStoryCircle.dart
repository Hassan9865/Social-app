import 'package:flutter/material.dart';
import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class Buildstorycircle extends ViewModelWidget<HomeViewModel> {
  final int index;

  const Buildstorycircle(
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    // final screenHeight = MediaQuery.of(context).size.height;

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
              style: TextStyle(
                fontSize: 12,
                color: viewModel.isDarkTheme ? Colors.white : Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
