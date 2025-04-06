import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:social_app/app/app.locator.dart';
import 'package:social_app/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();

  void navigateToStoryview(String imageUrl, String name) {
    navigationService.navigateTo(Routes.storyView,
        arguments: StoryViewArguments(imageUrl: imageUrl, name: name));
  }

  void navigateToNotification() {
    navigationService.navigateToNotificationView();
  }
}
