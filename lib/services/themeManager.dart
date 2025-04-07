import 'package:stacked/stacked.dart';

class ThemeManager with ListenableServiceMixin {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
