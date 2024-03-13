import 'package:layer_2/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:layer_2/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:layer_2/ui/views/home/home_view.dart';
import 'package:layer_2/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:layer_2/ui/views/login/login_view.dart';
import 'package:layer_2/services/local_storage_service.dart';
import 'package:layer_2/ui/views/register/register_view.dart';
import 'package:layer_2/ui/views/landing/landing_view.dart';
import 'package:layer_2/ui/views/landing/landing_view.dart';
import 'package:layer_2/ui/views/token/token_view.dart';
import 'package:layer_2/ui/views/bet/bet_view.dart';
import 'package:layer_2/ui/views/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:layer_2/services/api_service.dart';
import 'package:layer_2/ui/views/previous_bets/previous_bets_view.dart';
import 'package:layer_2/ui/views/place_bet/place_bet_view.dart';
import 'package:layer_2/services/contract_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: LandingView),
    MaterialRoute(page: TokenView),
    MaterialRoute(page: BetView),
    MaterialRoute(page: BottomNavBarView),
    MaterialRoute(page: PreviousBetsView),
    MaterialRoute(page: PlaceBetView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: BettingContractService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
