import 'package:http/http.dart' as http;

class CurrencyAPIClient {
  Future<String> fetch() async {
    final response =
        await http.get(Uri.parse('https://api.coinbase.com/v2/currencies'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load');
    }
  }
}
