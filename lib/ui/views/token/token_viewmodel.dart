part of 'token_view.dart';

class TokenViewModel extends BaseViewModel {
  final logger = getLogger('TokenViewModel');
  Map<String, String> addressesMap =
      extractAddresses(globalW3mService.session!);

  TokenViewModel() {
    globalW3mService.addListener(_chainChangeListener);
  }

  void _chainChangeListener() {
    if (globalW3mService.selectedChain != null) {
      _handleChainChange(globalW3mService.selectedChain);
    }
  }

  void _handleChainChange(W3MChainInfo? newChain) {
    log("Chain changed: ${newChain?.chainName ?? "No chain"}");
    log("Inside Future");
    log(globalW3mService.session!.getAccounts()!.toString());

    addressesMap = extractAddresses(globalW3mService.session!);
    rebuildUi();
    notifyListeners();
  }

  @override
  void dispose() {
    globalW3mService.removeListener(_chainChangeListener);
    super.dispose();
  }
}
