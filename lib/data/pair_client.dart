import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market/models/pair_data.dart';
import 'package:market/repository/pair/pair_repository.dart';
import 'package:market/settings.dart';

class PairClient extends http.BaseClient implements PairRepository {
  final http.Client _inner = http.Client();
  final url = Uri.https(Settings.baseUrl, "/v0/pairs");

  PairClient();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request);
  }

  @override
  Future<List<PairData>> loadPairs() async {
    final response = await _inner.get(url);
    return (json.decode(response.body)['data'] as List)
        .map((e) => PairData.fromJson(e))
        .toList();
  }
}
