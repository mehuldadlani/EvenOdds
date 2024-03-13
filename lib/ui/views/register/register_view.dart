import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:layer_2/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_2/app/app.router.dart';
import 'package:layer_2/file_exporter.dart';

part 'register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,

            title: Text(
              "EvenOdds",
              style: GoogleFonts.syne(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Change text color
              ),
            ),
            backgroundColor: Colors.transparent, // Make app bar transparent
            elevation: 0, // Remove app bar elevation
            centerTitle: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            height: 450.hWise,
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
                Text("Sign Up",
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
                    controller: viewModel.usernameController,
                    decoration: InputDecoration(
                      // errorText: viewModel.usernameErrorText,
                      border: InputBorder.none,
                      hintText: "Enter your username",
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
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      // errorText: viewModel.passwordErrorText,
                      border: InputBorder.none,
                      hintText: "Enter your password",
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
                    Center(
                        child: W3MNetworkSelectButton(
                      service: globalW3mService,
                      size: BaseButtonSize.regular,
                    ))
                  ],
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
                        onPressed: () {
                          Logger().i("Sign up button pressed");
                          viewModel.signup(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sign up",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already an user!  ",
                      style: GoogleFonts.syne(
                        fontSize: 16.hWise,
                        fontWeight: FontWeight.bold,
                        color: black.withOpacity(0.5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Logger().i("Sign in button pressed");
                      },
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.syne(
                          fontSize: 16.hWise,
                          fontWeight: FontWeight.bold,
                          color: appGreen,
                        ),
                      ),
                    ),
                  ],
                ).alignC
              ],
            ),
          ).alignC,
        );
      },
    );
  }
}
