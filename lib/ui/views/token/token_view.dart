import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layer_2/file_exporter.dart';

part 'token_viewmodel.dart';

class TokenView extends StatelessWidget {
  const TokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TokenViewModel>.reactive(
      viewModelBuilder: () => TokenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white, // Change background color
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Tokens",
              style: GoogleFonts.syne(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Change text color
              ),
            ),
            backgroundColor: Colors.transparent, // Make app bar transparent
            elevation: 0, // Remove app bar elevation
            centerTitle: false,
            actions: [
              globalW3mService.selectedChain != null
                  ? GestureDetector(
                      onTap: () {
                        globalW3mService.openModal(context);
                      },
                      child: const Icon(
                        FontAwesomeIcons.bitcoin,
                        color: Colors.black, // Change icon color
                        size: 30,
                      ),
                    )
                  : Container(),
              const SizedBox(width: 10), // Added SizedBox instead of 10.wGap
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                      height: 40), // Added SizedBox instead of 40.hGap
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ).alignC,
                  const SizedBox(
                      height: 20), // Added SizedBox instead of 20.hGap
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: appGreen, // Change container color
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: appGreen, // Change border color
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Username",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                        Text(
                          LocalStorageService().read('username') ??
                              'No Username',
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color:
                          appGreen.withOpacity(0.8), // Change container color
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: appGreen, // Change border color
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Address",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                        Text(
                          // Use chain ID to retrieve the wallet address from the address map
                          "${model.addressesMap[globalW3mService.selectedChain?.chainId]?.substring(0, 4) ?? '0x80'}...${model.addressesMap[globalW3mService.selectedChain?.chainId]?.substring(model.addressesMap[globalW3mService.selectedChain?.chainId]!.length - 4) ?? 'be99'}",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color:
                          appGreen.withOpacity(0.8), // Change container color
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: appGreen, // Change border color
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Balance",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                        Text(
                          "${globalW3mService.chainBalance.toString()} ${globalW3mService.selectedChain?.tokenName}",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color:
                          appGreen.withOpacity(0.8), // Change container color
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: appGreen, // Change border color
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Chain",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                        Text(
                          "${globalW3mService.selectedChain?.chainId.characters.string}",
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).alignC,
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 100), // Added SizedBox instead of 100.hGap
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
