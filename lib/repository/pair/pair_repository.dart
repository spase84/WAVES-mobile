import 'package:market/models/pair_data.dart';

abstract class PairRepository {
  Future<List<PairData>> loadPairs();
  Future<PairData> loadPairDetails(String amountAsset, String priceAsset);
}
