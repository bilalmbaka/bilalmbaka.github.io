# Clawing back space if running flutter apps.

_Every iOS build generates intermediate compilation files, and every iOS simulator version downloads multi-gigabyte runtimes._

```bash
rm -rf ~/Library/Developer/Xcode/DerivedData/*
```

_Delete old, unused iOS simulators_

```bash
xcrun simctl erase all
xcrun simctl delete unavailable
```

_Clean pub cache globally_

```bash
flutter pub cache clean
```

_Clear accumulated Gradle build caches_

```bash
rm -rf ~/.gradle/caches/
rm -rf ~/.gradle/daemon/
rm -rf ~/.gradle/native/
rm -rf ~/.gradle/wrapper/dists/
```

_Android SDK & Emulator System Images_

```bash
rm -rf ~/Library/Android/sdk/system-images/*
rm -rf ~/.android/cache/*
rm -rf ~/.android/avd/*.avd/snapshots/
```


# Clawing back space if running node apps.

_Clear NPM and Yarn caches_

```bash
npm cache clean --force
yarn cache clean
```