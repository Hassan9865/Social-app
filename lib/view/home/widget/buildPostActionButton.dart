import 'package:flutter/material.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class BuildPostActionButton extends ViewModelWidget<HomeViewModel> {
  final IconData icon;
  final String label;

  const BuildPostActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: viewModel.isDarkTheme ? Colors.white : Colors.blueGrey,
      ),
      label: Text(label,
          style: TextStyle(
            color: viewModel.isDarkTheme ? Colors.white : Colors.blueGrey,
          )),
      style: TextButton.styleFrom(
        minimumSize: Size(0, 40),
      ),
    );
  }
}
