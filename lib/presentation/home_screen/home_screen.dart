import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:market/models/pair_data.dart';
import 'package:market/redux/app_state.dart';
import 'package:market/resources/text_styles.dart';
import 'package:market/widgets/cards/pair_card.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  const HomeScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pairs, 24 hours changes",
            style: TextStyles().h2(Colors.orange)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: StoreConnector<AppState, _ViewModel>(
          builder: (context, vm) {
            if (vm.isLoading) {
              return Container();
            }

            return ListView.builder(
                itemCount: vm.pairs.length,
                itemBuilder: (context, index) {
                  return PairCard(pair: vm.pairs[index]);
                });
          },
          converter: _ViewModel.fromStore),
    );
  }
}

class _ViewModel {
  final List<PairData> pairs;
  final bool isLoading;

  _ViewModel({
    required this.pairs,
    required this.isLoading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      pairs: store.state.pairList,
      isLoading: store.state.isLoading,
    );
  }
}
