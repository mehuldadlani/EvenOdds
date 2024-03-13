import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_2/app/app.router.dart';
import 'package:layer_2/file_exporter.dart';
import 'package:layer_2/services/api_service.dart';
import 'package:stacked/stacked.dart';

part 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
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
      body: Form(
        key: viewModel.formKey,
        child: Container(
          height: 350.hWise,
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
              Text("Sign In",
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (viewModel.invalidPassword) {
                      return 'Invalid password'; // This will show when the password is incorrect after API call
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                  Container(
                    height: 50.hWise,
                    width: 140.hWise,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appGreen,
                    ),
                    child: ElevatedButton(
                      // onPressed: () => viewModel.signinHandler(context),
                      onPressed: () {
                        Logger().i("Sign in button pressed");
                        viewModel.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
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
                    "Don't have an account?  ",
                    style: GoogleFonts.syne(
                      fontSize: 16.hWise,
                      fontWeight: FontWeight.bold,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  GestureDetector(
                    // onTap: viewModel.signupHandler,|
                    onTap: viewModel.navigateToRegister,
                    child: Text(
                      "Sign up",
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
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
