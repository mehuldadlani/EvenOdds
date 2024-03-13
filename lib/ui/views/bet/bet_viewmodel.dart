part of 'bet_view.dart';

class BetViewModel extends BaseViewModel {
  final ApiService apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<BetModel> bets = [];
  bool isLoading = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> fetchBets() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await apiService.get('bet/');
      print(response);

      if (response['success'] == true) {
        final responseData = response['data']; // Get the data field
        final List<dynamic> data = responseData['data']; // Get the list of bets
        bets = data.map((json) => BetModel.fromJson(json)).toList();
        isLoading = false;
        notifyListeners();
      } else {
        throw Exception(response['error'] ?? 'Unknown error');
      }
    } catch (e) {
      print('Error fetching bets: $e');
      isLoading = false;
      notifyListeners();
    }
  }

  void placeBet(String id, String name) {
    // Navigate to the place bet view with arguments
    _navigationService.navigateTo(
      Routes.placeBetView,
      arguments: PlaceBetViewArguments(betName: name, betId: id),
    );
  }
}
