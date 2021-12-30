import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/application/providers/currency_provider.dart';
import 'package:speedup_sandbox/domain/entities/currency_entity.dart';
import 'package:speedup_sandbox/domain/repository/currency_repository.dart';

class FakeCurrencyRepository implements CurrencyRepository {
  @override
  Future<List<CurrencyEntity>> fetch() async {
    return [
      CurrencyEntity(id: "1", name: "hoge", minSize: "0"),
    ];
  }
}

void main() {
  test('Override repository provider.', () async {
    final fakeData = await FakeCurrencyRepository().fetch();
    final container = ProviderContainer(
      overrides: [
        currencyFutureProvider.overrideWithValue(AsyncValue.data(fakeData)),
      ],
    );

    final currency = container.read(currencyFutureProvider);

    expect(currency.asData?.value, [
      isA<CurrencyEntity>()
          .having((entity) => entity.id, 'id', '1')
          .having((entity) => entity.name, 'name', 'hoge')
          .having((entity) => entity.minSize, 'minSize', '0'),
    ]);
  });
}
