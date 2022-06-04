import 'package:json_annotation/json_annotation.dart';

part 'pair.g.dart';

@JsonSerializable(createToJson: false)
class Pair {
  Pair(
    this.firstPrice,
    this.lastPrice,
    this.volume,
    this.quoteVolume,
    this.high,
    this.low,
    this.weightedAveragePrice,
    this.txsCount,
    this.volumeWaves,
  );

  factory Pair.fromJson(Map<String, dynamic> json) => _$PairFromJson(json);

  final double firstPrice;
  final double lastPrice;
  final double volume;
  final double quoteVolume;
  final double high;
  final double low;
  final double weightedAveragePrice;
  final double txsCount;
  final double volumeWaves;
}
