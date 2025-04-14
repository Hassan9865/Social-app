import 'package:flutter/material.dart';
import 'package:social_app/app/app.locator.dart';
import 'package:social_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await setupLocator();
  runApp(const MyResponsiveWrapper());
}

class MyResponsiveWrapper extends StatelessWidget {
  const MyResponsiveWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double screenWidth = constraints.maxWidth;

        // Set a max width like mobile (e.g., 420)
        double targetWidth = screenWidth > 500 ? 420 : screenWidth;

        return Center(
          child: SizedBox(
            width: targetWidth,
            child: const MyApp(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
