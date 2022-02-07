import 'package:speedup_sandbox/common/dio.dart';
import 'package:speedup_sandbox/entities/example/currency_entity.dart';

class CurrencyRepository {
  static Future<List<CurrencyEntity>> fetch() async {
    final response = await dio.get('https://api.coinbase.com/v2/currencies');
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((e) => CurrencyEntity.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
