part of 'bottom_nav_bar_view.dart';

class BottomNavBarViewModel extends BaseViewModel {
  final logger = getLogger('BottomNavBarViewModel');

  final NotchBottomBarController controller =
      NotchBottomBarController(index: 0);
  final PageController pageController = PageController(initialPage: 0);
  final ScrollController scrollController = ScrollController();

  int maxCount = 3;

  final List<Widget> bottomBarPages = [
    const BetView(),
    const PreviousBetsView(),
    const TokenView(),
  ];
}
