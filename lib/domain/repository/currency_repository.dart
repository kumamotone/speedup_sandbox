import 'dart:convert';

import 'package:speedup_sandbox/domain/entities/currency_entity.dart';
import 'package:speedup_sandbox/infrastructure/api_client/currency_api_client.dart';

class CurrencyRepository {
  final _client = CurrencyAPIClient();

  Future<List<CurrencyEntity>> fetch() async {
    final json = await _client.fetch();
    final decodedJson = jsonDecode(json)['data'] as List;
    return decodedJson.map((e) => CurrencyEntity.fromJson(e)).toList();
  }
}
