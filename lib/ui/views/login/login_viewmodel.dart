part of 'login_view.dart';

class LoginViewModel extends BaseViewModel {
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService apiService = locator<ApiService>();

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool invalidPassword = false;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      // await _localStorageService.write('username', usernameController.text);
      // await _localStorageService.write('password', passwordController.text);
      apiService.post('192.168.1.3', {
        'username': usernameController.text,
        'password': passwordController.text,
      }).then((response) {
        if (response['success']) {
          _navigationService.navigateTo(Routes.tokenView);
        } else {
          invalidPassword = true;
          notifyListeners();
        }
      });
      _navigationService.navigateTo(Routes.registerView);
    }
  }

  navigateToRegister() {
    _navigationService.navigateTo(Routes.registerView);
  }

  @override
  dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
