import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app/view/login/login_view.dart';
import 'package:social_app/view/splash/splah_viewModel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) {
        Timer(
          Duration(seconds: 6),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          ),
        );

        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Lottie.asset("assets/lottie/splash.json")),
        );
      },
    );
  }
}
