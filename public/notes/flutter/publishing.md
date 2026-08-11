# Publishing to android

__Generate signing key__

```bash
keytool -genkey -v -keystore /desired-destination -keyalg RSA -keysize 2048 -validity 1000 -alias upload
```

__Create a key.properties file in android directory__

storePassword=<password-from-previous-step>
keyPassword=<password-from-previous-step>
keyAlias=upload
storeFile=<keystore-file-location>


_[project]/android/app/build.gradle.kts_

In android/key.properties

```
storeFile=path
storePassword=password
keyAlias=alias
keyPassword=password
```

In android/app/build.gradle

```gradle
def keyproperties = new Properties()
def keyPropertiesFile = rootProject.file("key.properties")
if (keyPropertiesFile.exists()) {
    keyPropertiesFile.withReader('UTF-8') { reader ->
        keyproperties.load(reader)
    }
}

android {
  ...
     signingConfigs {
        release {
            if (keyPropertiesFile.exists()) {
                keyAlias keyproperties["keyAlias"]
                keyPassword keyproperties["keyPassword"]
                storeFile file(keyproperties["storeFile"])
                storePassword keyproperties["storePassword"]
            }
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
        }

        debug {
            signingConfig signingConfigs.debug
        }
    }
    ...
}

```

- or if you are using build.gradle.kts

__in the android block add these.__

```
import java.util.Properties
import java.io.FileInputStream
``

_Add this before the android block_

```
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
```

_Add this in android block_

```
signingConfigs {
    create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
    }
}

buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.getByName("release")
        }
}


### Appstore

```bash
flutter build ipa
```

### Upload the app bundle to App Store Connect

__Method A__

1. open build/ios/archive/MyApp.xcarchive in Xcode.
2. Click the Validate App button. If any issues are reported, address them and produce another build. You can reuse the same build ID until you upload an archive.
3. After the archive has been successfully validated, click Distribute App.

*Xcode will create a directory containing an IPA of your app and an ExportOptions.plist file. You can create new IPAs with the same options without launching Xcode by running flutter build ipa --export-options-plist=path/to/ExportOptions.plist*

### Create a new certificate.

1. Launch Keychain Access located in /Applications/Utilities.

2. Choose Keychain Access > Certificate Assistant > Request a Certificate from a Certificate Authority.

3. In the Certificate Assistant dialog, enter an email address in the User Email Address field.

4. In the Common Name field, enter a name for the key (for example, Gita Kumar Dev Key).

5. Leave the CA Email Address field empty.

6. Choose “Saved to disk,” then click Continue.
