import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:layer_2/app/app.router.dart';
import 'package:layer_2/file_exporter.dart';
import 'package:layer_2/ui/views/bet/bet_view.dart';
import 'package:layer_2/ui/views/login/login_view.dart';
import 'package:layer_2/ui/views/previous_bets/previous_bets_view.dart';
import 'package:layer_2/ui/views/register/register_view.dart';
import 'package:layer_2/ui/views/startup/startup_view.dart';
import 'package:layer_2/ui/views/token/token_view.dart';

part 'bottom_nav_bar_viewmodel.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavBarViewModel>.reactive(
      viewModelBuilder: () => BottomNavBarViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: PageView(
            controller: viewModel.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(viewModel.bottomBarPages.length,
                (index) => viewModel.bottomBarPages[index]),
          ),
          extendBody: true,
          bottomNavigationBar:
              (viewModel.bottomBarPages.length <= viewModel.maxCount)
                  ? AnimatedNotchBottomBar(
                      notchBottomBarController: viewModel.controller,
                      color: Colors.white,
                      showLabel: false,
                      notchColor: Colors.white,
                      removeMargins: false,
                      bottomBarWidth: 500,
                      durationInMilliSeconds: 300,
                      bottomBarItems: const [
                        BottomBarItem(
                          inActiveItem: Icon(
                            FeatherIcons.home,
                            color: Colors.blueGrey,
                          ),
                          activeItem: Icon(
                            FeatherIcons.home,
                            color: appGreen,
                          ),
                        ),
                        BottomBarItem(
                          inActiveItem: Icon(
                            FeatherIcons.plus,
                            color: Colors.blueGrey,
                          ),
                          activeItem: Icon(
                            FeatherIcons.plus,
                            color: appGreen,
                          ),
                        ),
                        BottomBarItem(
                          inActiveItem: Icon(
                            FeatherIcons.star,
                            color: Colors.blueGrey,
                          ),
                          activeItem: Icon(
                            FeatherIcons.star,
                            color: appGreen,
                          ),
                        ),
                      ],
                      onTap: (index) {
                        log('current selected index $index');
                        viewModel.pageController.jumpToPage(index);
                      },
                      kIconSize: 30,
                      kBottomRadius: 10,
                    )
                  : null,
        );
      },
    );
  }
}
