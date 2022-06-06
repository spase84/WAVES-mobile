import 'package:market/models/pair_data.dart';

class LoadPairsAction {}

class LoadPairDetailsAction {
  final String amountAsset;
  final String priceAsset;

  LoadPairDetailsAction(this.amountAsset, this.priceAsset);
}

class PairsNotLoadedAction {}

class PairsLoadedAction {
  final List<PairData> pairList;

  PairsLoadedAction(this.pairList);
}

class PairDetailsLoadedAction {
  final PairData pairData;

  PairDetailsLoadedAction(this.pairData);
}
