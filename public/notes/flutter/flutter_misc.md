### When you have changed build miniumum deploymnet target on ios 
### but still get the error.

```bash
flutter build ios --config-only
```

__Stuck on a project not building that still
uses pod?__

```bash
flutter clean
flutter pub get
cd ios
rm Podlock.file
pod repo update
pod install
cd ..
```