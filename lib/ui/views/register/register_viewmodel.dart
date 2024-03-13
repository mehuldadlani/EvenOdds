part of 'register_view.dart';

class RegisterViewModel extends BaseViewModel {
  final ApiService apiService = locator<ApiService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final logger = getLogger('RegisterViewModel');

  String id = '';

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      await _localStorageService.write('username', usernameController.text);
      await _localStorageService.write('password', passwordController.text);
      _navigationService.navigateTo(Routes.loginView);
    }
  }

  Future<void> signup(BuildContext context) async {
    Map<String, String> addressesMap =
        extractAddresses(globalW3mService.session!);
    final walletId =
        addressesMap[globalW3mService.selectedChain?.chainId ?? ''];

    final response = await apiService.post('user/', {
      'username': usernameController.text,
      'password': passwordController.text,
      'walletId': walletId,
    });
    log(response.toString());
    if (response['success'] == true) {
      // Extract the 'id' from the 'data' object
      id = response['data']['_id'];
      // Now you can use the 'id' variable as needed
    } else {
      // Handle error if the response was not successful
    }

    log('User registered successfully. ID: $id');
    _localStorageService.write('backendId', id);
    _localStorageService.write('username', usernameController.text);

    _navigationService.navigateTo(Routes.bottomNavBarView);
  }
}
