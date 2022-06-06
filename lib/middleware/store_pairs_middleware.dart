import 'package:market/redux/actions/actions.dart';
import 'package:market/redux/app_state.dart';
import 'package:market/repository/pair/pair_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreTodosMiddleware(
  PairRepository repository,
) {
  final loadPairs = _createLoadPairs(repository);
  final loadPairDetails = _createLoadPairDetails(repository);

  return [
    TypedMiddleware<AppState, LoadPairsAction>(loadPairs),
    TypedMiddleware<AppState, LoadPairDetailsAction>(loadPairDetails),
    TypedMiddleware<AppState, PairsLoadedAction>(loadPairs),
  ];
}

Middleware<AppState> _createLoadPairDetails(PairRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPairDetails(action.amountAsset, action.priceAsset).then(
      (pair) {
        store.dispatch(
          PairDetailsLoadedAction(pair),
        );
      },
    ).catchError((e) {
      print(e.toString());
      store.dispatch(PairsNotLoadedAction());
    });
  };
}

Middleware<AppState> _createLoadPairs(PairRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPairs().then(
      (pairs) {
        store.dispatch(
          PairsLoadedAction(pairs),
        );
      },
    ).catchError((_) => store.dispatch(PairsNotLoadedAction()));

    next(action);
  };
}
