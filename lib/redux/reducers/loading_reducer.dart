import 'package:market/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, PairsLoadedAction>(_setLoaded),
  // TypedReducer<bool, TodosNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
