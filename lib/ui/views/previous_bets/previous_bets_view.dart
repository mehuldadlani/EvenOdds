import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/api_service.dart';
import '../../../services/local_storage_service.dart';

part 'previous_bets_viewmodel.dart';

class PreviousBetsView extends StatelessWidget {
  const PreviousBetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreviousBetsViewModel>.reactive(
      viewModelBuilder: () => PreviousBetsViewModel(),
      onModelReady: (viewModel) => viewModel.fetchPreviousBets(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Previous Bets'),
          ),
          body: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : viewModel.hasError
                  ? const Center(
                      child: Text('An error occurred!'),
                    )
                  : viewModel.bets.isNotEmpty
                      ? ListView.builder(
                          itemCount: viewModel.bets.length,
                          itemBuilder: (context, index) {
                            final bet = viewModel.bets[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bet ID: ${bet.id}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Amount: ${bet.amount}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      Text(
                                        'Odds: ${bet.odds}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      Text(
                                        'Option: ${bet.option}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      Text(
                                        'Status: ${bet.status}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text('No previous bets found.'),
                        ),
        );
      },
    );
  }
}
