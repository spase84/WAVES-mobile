import 'package:market/models/pair_data.dart';

class LoadPairsAction {}

class PairsNotLoadedAction {}

class PairsLoadedAction {
  final List<PairData> pairList;

  PairsLoadedAction(this.pairList);

  @override
  String toString() {
    return 'PairsLoadedAction{todos: $pairList}';
  }
}
