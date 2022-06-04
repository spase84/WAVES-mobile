import 'package:json_annotation/json_annotation.dart';
import 'package:market/models/pair.dart';

part 'pair_data.g.dart';

@JsonSerializable(createToJson: false)
class PairData {
  PairData(
    this.data,
    this.amountAsset,
    this.priceAsset,
  );

  factory PairData.fromJson(Map<String, dynamic> json) =>
      _$PairDataFromJson(json);

  final Pair data;
  final String amountAsset;
  final String priceAsset;
}
