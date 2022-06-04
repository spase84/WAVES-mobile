import 'package:flutter/material.dart';
import 'package:market/app.dart';
import 'package:market/data/pair_client.dart';
import 'package:market/middleware/store_pairs_middleware.dart';
import 'package:market/redux/app_reducer.dart';
import 'package:market/redux/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MarketApp(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
      middleware: createStoreTodosMiddleware(PairClient()),
    ),
  ));
}
