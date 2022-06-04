import 'package:market/redux/reducers/loading_reducer.dart';
import 'package:market/redux/reducers/pairs_reducer.dart';
import 'package:market/redux/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    pairList: pairsReducer(state.pairList, action),
    // activeTab: tabsReducer(state.activeTab, action),
  );
}
