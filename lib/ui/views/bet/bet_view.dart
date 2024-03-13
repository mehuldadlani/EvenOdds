import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../services/api_service.dart';
import '../../../ui/data_models/bet_model.dart';
import '../../../app/app.router.dart';
import '../../../file_exporter.dart'; // Import necessary files and packages

part 'bet_viewmodel.dart'; // Import the associated view model file

class BetView extends StatelessWidget {
  const BetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BetViewModel>.reactive(
      viewModelBuilder: () => BetViewModel(),
      onModelReady: (model) => model.fetchBets(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Bets',
            style: GoogleFonts.syne(), // Set font to GoogleFonts.syne
          ),
          automaticallyImplyLeading: false, // Remove automaticallyImplyLeading
        ),
        body: model.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.bets.length,
                itemBuilder: (context, index) {
                  final bet = model.bets[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bet.bet,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ), // Set font style
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Option One: ${bet.optionOne} (Odds: ${bet.oddsOne})',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Option Two: ${bet.optionTwo} (Odds: ${bet.oddsTwo})',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Start Time: ${bet.startTime}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Finish Time: ${bet.finishTime}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Current Result: ${_getResultText(bet.result)}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                model.placeBet(bet.id, bet.bet);
                              },
                              child: Text('Place Bet'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  String _getResultText(int result) {
    switch (result) {
      case 0:
        return 'Undecided';
      case 1:
        return 'Final Result After Completion';
      case 2:
        return 'Final Result After Completion';
      default:
        return 'Unknown';
    }
  }
}
