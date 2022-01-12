import '../dio.dart';

class CurrencyAPIClient {
  Future fetch() async {
    final response = await dio.get('https://api.coinbase.com/v2/currencies');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load');
    }
  }
}
