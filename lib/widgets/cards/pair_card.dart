import 'package:flutter/material.dart';
import 'package:market/models/pair_data.dart';
import 'package:market/resources/text_styles.dart';

class PairCard extends StatefulWidget {
  final PairData pair;
  const PairCard({Key? key, required this.pair}) : super(key: key);

  @override
  State<PairCard> createState() => _PairCardState();
}

class _PairCardState extends State<PairCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            _getRow(
                title: "First Price",
                value: widget.pair.data.firstPrice.toStringAsFixed(5)),
            _getRow(
                title: "Last Price",
                value: widget.pair.data.lastPrice.toStringAsFixed(5)),
            _getRow(
                title: "Volume",
                value: widget.pair.data.volume.toStringAsFixed(5),
                titleColor: Colors.amber,
                valueColor: Colors.greenAccent),
            _getRow(
                title: "Quote Volume",
                value: widget.pair.data.quoteVolume.toStringAsFixed(6)),
            _getRow(
                title: "Low", value: widget.pair.data.low.toStringAsFixed(5)),
            _getRow(
                title: "High", value: widget.pair.data.high.toStringAsFixed(5)),
          ]),
        ),
      ),
    );
  }

  Widget _getRow(
      {required String title,
      required String value,
      Color? titleColor,
      Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles().title1medium(
                titleColor ?? const Color.fromARGB(255, 106, 158, 184)),
          ),
          Text(
            value,
            style: TextStyles().title1medium(valueColor ?? Colors.white),
          ),
        ],
      ),
    );
  }
}
