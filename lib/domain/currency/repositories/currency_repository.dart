import 'package:speedup_sandbox/foundation/network/dio.dart';
import 'package:speedup_sandbox/domain/currency/models/currency.dart';

class CurrencyRepository {
  static Future<List<Currency>> fetch() async {
    final response = await dio.get('https://api.coinbase.com/v2/currencies');
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((e) => Currency.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
