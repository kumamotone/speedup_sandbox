import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speedup_sandbox/application/providers/currency_provider.dart';
import 'package:speedup_sandbox/domain/entities/currency_entity.dart';
import 'package:speedup_sandbox/presentation/home.dart';

void main() {
  testWidgets('Testing loading view.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currencyFutureProvider.overrideWithValue(
            const AsyncValue.loading(),
          ),
        ],
        child: const MaterialApp(home: FirstPage()),
      ),
    );
    // The first frame is a loading state.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Testing empty list view.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currencyFutureProvider.overrideWithValue(
            const AsyncValue.data([]),
          ),
        ],
        child: const MaterialApp(home: FirstPage()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('empty'), findsOneWidget);
  });

  testWidgets('Testing list view.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currencyFutureProvider.overrideWithValue(
            AsyncValue.data(
              [CurrencyEntity(id: "1", name: "name", minSize: "0")],
            ),
          ),
        ],
        child: const MaterialApp(home: FirstPage()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('name'), findsOneWidget);
  });

  testWidgets('Testing error view.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currencyFutureProvider.overrideWithValue(
            AsyncValue.error(Exception('error content')),
          ),
        ],
        child: const MaterialApp(home: FirstPage()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('error'), findsOneWidget);
  });
}
