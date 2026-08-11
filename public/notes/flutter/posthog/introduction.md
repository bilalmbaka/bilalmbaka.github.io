# Sources
* https://posthog.com/docs/libraries/flutter


```dart
posthog_flutter: ^5.26.0
```

## Android setup

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="your.package.name">
    <application>
        <!-- ... other configuration ... -->
        <meta-data android:name="com.posthog.posthog.AUTO_INIT" android:value="false" />
    </application>
</manifest>
```

## iOS setup

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <!-- rest of your configuration -->
    <key>com.posthog.posthog.AUTO_INIT</key>
    <false/>
</dict>
</plist>
```

## Dart setup (For manual step only)

```dart
Future<void> main() async {
  // init WidgetsFlutterBinding if not yet
  WidgetsFlutterBinding.ensureInitialized();
  final config = PostHogConfig('<ph_project_token>');
  config.debug = true;
  // captureApplicationLifecycleEvents is enabled by default since version 5.23.0
  config.host = 'https://us.i.posthog.com';
  await Posthog().setup(config);
  runApp(MyApp());
}
```

## Using navigatorObservers

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // If you're using session replay, `PostHogWidget` has to be the root, and `MaterialApp` must be the child.
    return MaterialApp(
      navigatorObservers: [
        // The PosthogObserver records screen views automatically
        PosthogObserver(),
      ],
      ...
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    ...
  ],
  // The PosthogObserver records screen views automatically
  observers: [PosthogObserver()],
);
```

### Identifying users

```dart
await Posthog().identify(
  userId: emailController.text, 
  userProperties: {"name": "Peter Griffin", "email": "peter@familyguy.com"},
  userPropertiesSetOnce: {"date_of_first_log_in": "2024-03-01"}
);
```

