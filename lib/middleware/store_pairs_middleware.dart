import 'package:market/redux/actions/actions.dart';
import 'package:market/redux/app_state.dart';
import 'package:market/repository/pair/pair_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreTodosMiddleware(
  PairRepository repository,
) {
  final loadPairs = _createLoadTodos(repository);

  return [
    TypedMiddleware<AppState, LoadPairsAction>(loadPairs),
    TypedMiddleware<AppState, PairsLoadedAction>(loadPairs),
  ];
}

Middleware<AppState> _createLoadTodos(PairRepository repository) {
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
