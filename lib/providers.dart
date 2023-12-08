import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/entities/example/currency_entity.dart';
import 'package:speedup_sandbox/repositories/example/currency_repository.dart';

final currencyListProvider = FutureProvider<List<CurrencyEntity>>((ref) {
  return CurrencyRepository.fetch();
});
