import 'package:flutter_test/flutter_test.dart';

import 'package:speedup_sandbox/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Main());

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
  });
}
