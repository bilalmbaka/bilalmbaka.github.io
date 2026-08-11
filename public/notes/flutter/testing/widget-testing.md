# Widget Testing in Flutter

Widget tests verify that a widget builds, renders, and behaves as expected
without launching the full app.

## Why widget tests

- Fast and reliable compared to integration tests.
- Verify UI structure and interactions in isolation.
- Catch regressions early in the widget tree.

## Basic example

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('shows the counter at zero', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
```

## Common matchers

- `findsOneWidget` — exactly one widget matches.
- `findsNothing` — no widget matches.
- `findsWidgets` — one or more widgets match.

> Tip: use `tester.pumpAndSettle()` after animations to let the tree settle
> before asserting.
