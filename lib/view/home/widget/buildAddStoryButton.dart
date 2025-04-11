import 'package:flutter/material.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class Buildaddstorybutton extends ViewModelWidget<HomeViewModel> {
  final int index;

  const Buildaddstorybutton(
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
}
