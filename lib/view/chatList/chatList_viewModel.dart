import 'package:social_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatListViewModel extends BaseViewModel {
  NavigationService navigationService = NavigationService();

  navigateToChatView() {
    navigationService.navigateTo(Routes.chatView);
  }
}
