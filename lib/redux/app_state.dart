import 'package:flutter/material.dart';
import 'package:market/models/pair_data.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<PairData> pairList;
  final PairData? pairDataDetails;
  // final AppTab activeTab;

  const AppState(
      {this.isLoading = false, this.pairList = const [], this.pairDataDetails});

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith(
      {required bool isLoading,
      required List<PairData> pairList,
      PairData? pairDataDetails}) {
    return AppState(
        isLoading: isLoading,
        pairList: pairList,
        pairDataDetails: pairDataDetails);
  }
}
