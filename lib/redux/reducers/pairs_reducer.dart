import 'package:market/models/pair_data.dart';
import 'package:market/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final pairsReducer = combineReducers<List<PairData>>([
  TypedReducer<List<PairData>, PairsLoadedAction>(_setLoadedPairs),
]);

List<PairData> _setLoadedPairs(
    List<PairData> pairList, PairsLoadedAction action) {
  return action.pairList;
}
