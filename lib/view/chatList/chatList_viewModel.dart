import 'package:social_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatListViewModel extends BaseViewModel {
  NavigationService navigationService = NavigationService();

  navigateToChatView() {
    navigationService.navigateTo(Routes.chatView);
  }

  bool _switchValue = false;

  bool get switchValue => _switchValue;

  void updateSwitchValue(bool newValue) {
    _switchValue = newValue;
    notifyListeners();
  }
}
