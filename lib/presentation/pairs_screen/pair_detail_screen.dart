import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:market/redux/app_state.dart';
import 'package:market/resources/text_styles.dart';
import 'package:redux/redux.dart';

class PairDatailScreen extends StatefulWidget {
  final void Function() onInit;
  final String amountAsset;
  final String priceAsset;
  const PairDatailScreen(
      {Key? key,
      required this.onInit,
      required this.amountAsset,
      required this.priceAsset})
      : super(key: key);

  @override
  State<PairDatailScreen> createState() => _PairDatailScreenState();
}

class _PairDatailScreenState extends State<PairDatailScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return Scaffold(
              appBar: AppBar(
                title:
                    Text("Pair Details", style: TextStyles().h2(Colors.orange)),
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      _getRow(
                          title: "First Price",
                          value: vm.firstPrice.toStringAsFixed(5)),
                      _getRow(
                          title: "Last Price",
                          value: vm.lastPrice.toStringAsFixed(5)),
                      _getRow(
                          title: "Volume",
                          value: vm.volume.toStringAsFixed(5),
                          titleColor: Colors.amber,
                          valueColor: Colors.greenAccent),
                      _getRow(
                          title: "Quote Volume",
                          value: vm.quoteVolume.toStringAsFixed(6)),
                      _getRow(title: "Low", value: vm.low.toStringAsFixed(5)),
                      _getRow(title: "High", value: vm.high.toStringAsFixed(5)),
                    ]),
                  ),
                ),
              ));
        });
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

class _ViewModel {
  final double firstPrice;
  final double lastPrice;
  final double volume;
  final double quoteVolume;
  final double high;
  final double low;
  final double weightedAveragePrice;
  final double txsCount;
  final double volumeWaves;

  _ViewModel(
      this.firstPrice,
      this.lastPrice,
      this.volume,
      this.quoteVolume,
      this.high,
      this.low,
      this.weightedAveragePrice,
      this.txsCount,
      this.volumeWaves);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        store.state.pairDataDetails?.data.firstPrice ?? 0.0,
        store.state.pairDataDetails?.data.lastPrice ?? 0.0,
        store.state.pairDataDetails?.data.volume ?? 0.0,
        store.state.pairDataDetails?.data.quoteVolume ?? 0.0,
        store.state.pairDataDetails?.data.high ?? 0.0,
        store.state.pairDataDetails?.data.low ?? 0.0,
        store.state.pairDataDetails?.data.weightedAveragePrice ?? 0.0,
        store.state.pairDataDetails?.data.txsCount ?? 0.0,
        store.state.pairDataDetails?.data.volumeWaves ?? 0.0);
  }
}
