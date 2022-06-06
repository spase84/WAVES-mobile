import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:market/presentation/pairs_screen/pair_detail_screen.dart';
import 'package:market/presentation/pairs_screen/pairs_screen.dart';
import 'package:market/presentation/profile_screen/profile_screen.dart';
import 'package:market/presentation/tab_bar/bottom_nav_bar.dart';
import 'package:market/redux/actions/actions.dart';
import 'package:market/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:routemaster/routemaster.dart';

class MarketApp extends StatelessWidget {
  final Store<AppState> store;

  const MarketApp({Key? key, required this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) => RouteMap(
            onUnknownRoute: (route) => const Redirect('/'),
            routes: {
              '/': (routeData) => const CupertinoTabPage(
                    child: BottomNavBar(),
                    paths: [
                      '/home',
                      '/profile',
                    ],
                  ),
              '/home': (route) => MaterialPage(
                    child: StoreProvider<AppState>(
                      store: store,
                      child: PairsScreen(onInit: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(LoadPairsAction());
                      }),
                    ),
                  ),
              '/profile': (route) => const MaterialPage(
                    child: ProfileScreen(),
                  ),
              '/pair/detail/:amountAsset/:priceAsset': (route) => MaterialPage(
                      child: StoreProvider<AppState>(
                    store: store,
                    child: PairDatailScreen(
                      amountAsset: route.pathParameters['amountAsset'] ?? "",
                      priceAsset: route.pathParameters['priceAsset'] ?? "",
                      onInit: () {
                        StoreProvider.of<AppState>(context).dispatch(
                            LoadPairDetailsAction(
                                route.pathParameters['amountAsset'] ?? "",
                                route.pathParameters['priceAsset'] ?? ""));
                      },
                    ),
                  )),
            },
          ),
        ),
        routeInformationParser: const RoutemasterParser(),
        supportedLocales: const [
          Locale('ru'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
