# Unit Testing in Flutter

Unit tests verify a single function, class, or behavior in isolation.

## What to test

- Pure logic: calculators, formatters, validators.
- Models and repositories (with mocked data sources).
- State management logic.

## Example

```dart
import 'package:flutter_test/flutter_test.dart';

int add(int a, int b) => a + b;

void main() {
  test('adds two numbers', () {
    expect(add(2, 3), 5);
  });
}
```

## Run tests

```bash
flutter test
```

## Checklist

- [x] Fast, no UI needed
- [x] One behavior per test
- [ ] Keep tests independent
