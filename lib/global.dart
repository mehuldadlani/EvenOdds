import "file_exporter.dart";

late W3MService globalW3mService;

late W3MChainInfo mumbaiTestnet;

late W3MChainInfo shardeumTestnet;

Map<String, String> extractAddresses(W3MSession session) {
  List<String> addresses = session.getAccounts()!;
  late Map<String, String> addressMap = {};
  for (String address in addresses) {
    // Extract chainId from address string
    String chainId = address.split(":")[1];
    // Extract address without chainId
    String actualAddress = address.split(":")[2];
    addressMap[chainId] = actualAddress;
  }
  return addressMap;
}
