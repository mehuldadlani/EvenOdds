part of 'previous_bets_view.dart';

class PreviousBetsViewModel extends BaseViewModel {
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final ApiService _apiService = locator<ApiService>();

  List<PreviousBetModel> bets = [];
  bool isLoading = false;

  Future<void> fetchPreviousBets() async {
    try {
      isLoading = true;
      notifyListeners();

      final response =
          await _apiService.get('user/65f129791146738e5d99bb0b/bets/');
      if (response['success']) {
        final responseData = response['data'];
        final List<dynamic> data = responseData['data'];
        bets = data.map((json) => PreviousBetModel.fromJson(json)).toList();
        isLoading = false;
        notifyListeners();
      } else {
        throw Exception(response['error'] ?? 'Unknown error');
      }
    } catch (e) {
      print('Error fetching previous bets: $e');
      isLoading = false;
      notifyListeners();
    }
  }

  void login(BuildContext context) {
    // Implement login functionality if needed
  }
}

class PreviousBetModel {
  final String id;
  final double amount; // Add amount property
  final double odds; // Add odds property
  final int option; // Add option property
  final String status; // Add status property

  PreviousBetModel({
    required this.id,
    required this.amount,
    required this.odds,
    required this.option,
    required this.status,
  });

  factory PreviousBetModel.fromJson(Map<String, dynamic> json) {
    return PreviousBetModel(
      id: json['_id'],
      amount: json['amount'].toDouble(), // Adjust to match your JSON structure
      odds: json['odds'].toDouble(), // Adjust to match your JSON structure
      option: json['option'], // Adjust to match your JSON structure
      status: json['status'], // Adjust to match your JSON structure
    );
  }
}
