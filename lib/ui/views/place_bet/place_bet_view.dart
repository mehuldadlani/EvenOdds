import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_2/file_exporter.dart';
import 'package:stacked/stacked.dart';

import 'place_bet_viewmodel.dart';

class PlaceBetView extends StatelessWidget {
  const PlaceBetView({Key? key, required this.betId, required this.betName})
      : super(key: key);

  final String betId;
  final String betName;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PlaceBetViewModel(),
      onViewModelReady: (model) => model.setBetId(betId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Place Bet'),
          ),
          body: Form(
            key: model.formKey,
            child: Container(
              height: 420.hWise,
              width: 350.hWise,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
                border: Border.all(
                  color: appGreen,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Place Bet",
                      style: GoogleFonts.syne(
                        fontSize: 25.hWise,
                        fontWeight: FontWeight.bold,
                        color: black,
                      )).alignC,
                  20.hGap,
                  Container(
                    height: 50.hWise,
                    width: 300.hWise,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: black.withOpacity(0.2),
                        width: 1,
                      ),
                      color: white,
                    ),
                    child: TextFormField(
                      controller: model.betIdController,
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: betId,
                        hintStyle: GoogleFonts.syne(
                          fontSize: 16.hWise,
                          color: grey,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.wWise),
                      ),
                    ),
                  ),
                  20.hGap,
                  Container(
                    height: 50.hWise,
                    width: 300.hWise,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(
                        color: black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller: model.amountController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter amount",
                        hintStyle: GoogleFonts.syne(
                          fontSize: 16.hWise,
                          color: grey,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.wWise),
                      ),
                    ),
                  ),
                  30.hGap,
                  Container(
                    height: 50.hWise,
                    width: 300.hWise,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(
                        color: black.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller: model.optionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter option (0,1,2)",
                        hintStyle: GoogleFonts.syne(
                          fontSize: 16.hWise,
                          color: grey,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.wWise),
                      ),
                    ),
                  ),
                  30.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50.hWise,
                        width: 140.hWise,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appGreen,
                        ),
                        child: ElevatedButton(
                          // onPressed: () => viewModel.signinHandler(context),
                          onPressed: model.betPlace,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Place Bet",
                              style: GoogleFonts.syne(
                                fontSize: 16.hWise,
                                color: black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.hGap,
                ],
              ),
            ).alignC,
          ),
        );
      },
    );
  }
}
