import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

part 'landing_viewmodel.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LandingViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold();
        });
  }
}
