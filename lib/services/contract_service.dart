// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:web3modal_flutter/web3modal_flutter.dart';

class BettingContractService {}


//   late Web3Client _web3Client;
//   late DeployedContract _contract;

//   // Contract functions
//   late ContractFunction _placeBetFunction;
//   late ContractFunction _createEventFunction;
//   late ContractFunction _getAllPlayersFunction;

//   // Contract owner
//   EthereumAddress? _contractOwner;

//   // Contract address and ABI
//   static const String _contractAddress = '0x526d8703ce1F187289fE200d58c9eAbe887639D4';
//   String abiString = await rootBundle.loadString('assets/abi.json');

//   // Initialize Web3Client and DeployedContract
//   BettingContractService(Web3Client client) {
//     _web3Client = client;

//     _contract = DeployedContract(
//       ContractAbi.fromJson(jsonDecode(_contractABI), 'Betting'),
//       EthereumAddress.fromHex(_contractAddress),
//     );

//     // Initialize contract functions
//     _placeBetFunction = _contract.function('placeBet');
//     _createEventFunction = _contract.function('createEvent');
//     _getAllPlayersFunction = _contract.function('getAllPlayers');
//   }

//   // Function to place a bet
//   Future<void> placeBet(
//     BigInt eventId,
//     BigInt optionSelected,
//     EtherAmount value,
//     String privateKey,
//   ) async {
//     var credentials = await _web3Client.(privateKey);
//     var response = await _web3Client.sendTransaction(
//       credentials,
//       Transaction.callContract(
//         contract: _contract,
//         function: _placeBetFunction,
//         parameters: [BigInt.from(eventId), BigInt.from(optionSelected)],
//       ),
//       value: value,
//     );
//     print('Transaction hash: ${response.transactionHash}');
//   }

//   // Function to create an event
//   Future<void> createEvent(
//     BigInt eventId,
//     String name,
//     String title,
//     BigInt odds,
//     String privateKey,
//   ) async {
//     var credentials = await _web3Client.credentialsFromPrivateKey(privateKey);
//     var response = await _web3Client.sendTransaction(
//       credentials,
//       Transaction.callContract(
//         contract: _contract,
//         function: _createEventFunction,
//         parameters: [BigInt.from(eventId), name, title, BigInt.from(odds)],
//       ),
//     );
//     print('Transaction hash: ${response.transactionHash}');
//   }

//   // Function to get all players
//   Future<List<dynamic>> getAllPlayers() async {
//     return await _web3Client.call(
//       contract: _contract,
//       function: _getAllPlayersFunction,
//       params: [],
//     );
//   }

//   // Function to get contract owner
//   Future<EthereumAddress?> getContractOwner() async {
//     if (_contractOwner == null) {
//       List<dynamic> result = await _web3Client.call(
//         contract: _contract,
//         function: ContractFunction('owner', []),
//         params: [],
//       );
//       _contractOwner = result[0] as EthereumAddress?;
//     }
//     return _contractOwner;
//   }
// }
