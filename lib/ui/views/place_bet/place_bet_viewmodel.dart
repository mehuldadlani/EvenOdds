import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layer_2/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../file_exporter.dart';

class PlaceBetViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void setBetId(String betId) {
    betIdController.text = betId;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController betIdController = TextEditingController();
  final TextEditingController optionController = TextEditingController();

  betPlace() {
    navigationService.navigateTo(Routes.bottomNavBarView);
  }

  Future<void> testBettingContract() async {
    final ethClient = Web3Client('https://hackathon.shardeum.org/', Client());

    String abiString = await rootBundle.loadString('assets/abi.json');

    final deployedContract = DeployedContract(
      ContractAbi.fromJson(
        jsonDecode(abiString),
        'Betting',
      ),
      EthereumAddress.fromHex('0xBBDC2CfAdD1fEdA97695155769c082De1359B612'),
    );

    final placeBetFunction = deployedContract.function('placeBet');
    final createEventFunction = deployedContract.function('createEvent');
    final getAllPlayersFunction = deployedContract.function('getAllPlayers');

    final bet = await ethClient.call(contract: deployedContract, function: placeBetFunction, params: [

    ]);
  }
}
