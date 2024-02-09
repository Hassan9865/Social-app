import 'package:social_app/app/app.locator.dart';
import 'package:social_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  navigateToLogin() {
    navigationService.navigateTo(Routes.loginView);
  }
}
