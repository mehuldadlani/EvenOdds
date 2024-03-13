import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_2/app/app.bottomsheets.dart';
import 'package:layer_2/app/app.dialogs.dart';
import 'package:layer_2/app/app.router.dart';
import 'package:layer_2/file_exporter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  mumbaiTestnet = W3MChainInfo(
      chainName: " Polygon Mumbai",
      chainId: "80001",
      namespace: 'eip155:80001',
      tokenName: "Matic",
      rpcUrl: "https://polygon-mumbai-pokt.nodies.app",
      blockExplorer: W3MBlockExplorer(
          name: 'Mumbai Testnet', url: 'https://mumbai.polygonscan.com/'));

  shardeumTestnet = W3MChainInfo(
      chainName: "	Shardeum Dev Network",
      chainId: '8082',
      namespace: 'eip155:8082',
      tokenName: 'SHM',
      rpcUrl: 'https://hackathon.shardeum.org/');
  W3MChainPresets.chains.putIfAbsent('80001', () => mumbaiTestnet);
  W3MChainPresets.chains.putIfAbsent('8082', () => shardeumTestnet);
  globalW3mService = W3MService(
    projectId: 'a358ec3d23ebd61a414a762e7d1e6fce',
    metadata: const PairingMetadata(
      name: 'Web3Modal Flutter Example',
      description: 'Web3Modal Flutter Example',
      url: 'https://www.walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
      redirect: Redirect(
        native: 'flutterdapp://', // your own custom scheme
        universal: 'https://www.walletconnect.com',
      ),
    ),
  );
  await globalW3mService.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.syneTextTheme(Theme.of(context).textTheme),
        // Replace `Lato` with your desired Google Font
      ),
    );
  }
}
