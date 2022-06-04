import 'package:flutter/material.dart';
import 'package:market/models/pair_data.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<PairData> pairList;
  // final AppTab activeTab;

  const AppState({this.isLoading = false, this.pairList = const []});

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith(
      {required bool isLoading, required List<PairData> pairList}) {
    return AppState(isLoading: isLoading, pairList: pairList);
  }
}
