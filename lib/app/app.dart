import 'package:social_app/view/bottom_bar/bottom_bar.dart';
import 'package:social_app/view/chat/chat_view.dart';
import 'package:social_app/view/home/home_view.dart';
import 'package:social_app/view/login/login_view.dart';
import 'package:social_app/view/notification/notificate_view.dart';
import 'package:social_app/view/profile/profile_view.dart';
import 'package:social_app/view/signup/signup_view.dart';
import 'package:social_app/view/story/story_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(
    page: SignUpView,
  ),
  MaterialRoute(
    page: Bottombar,
  ),
  MaterialRoute(
    page: HomeView,
  ),
  MaterialRoute(
    page: ProfileView,
  ),
  MaterialRoute(
    page: NotificationView,
  ),
  MaterialRoute(
    page: ChatView,
  ),
  MaterialRoute(page: StoryView),
], dependencies: [
  Singleton(classType: NavigationService),
])
class app {}
