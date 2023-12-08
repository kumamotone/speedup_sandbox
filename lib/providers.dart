import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/domain/currency/models/currency.dart';
import 'package:speedup_sandbox/domain/currency/repositories/currency_repository.dart';

final currencyListProvider = FutureProvider<List<Currency>>((ref) {
  return CurrencyRepository.fetch();
});
