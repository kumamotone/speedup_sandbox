import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/domain/repository/currency_repository.dart';

final currencyRepositoryProvider = Provider((ref) => CurrencyRepository());

final currencyFutureProvider = FutureProvider((ref) async {
  final repository = ref.watch(currencyRepositoryProvider);
  return repository.fetch();
});
