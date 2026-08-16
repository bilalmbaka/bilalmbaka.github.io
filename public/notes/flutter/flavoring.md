# Flavoring flutter apps

### IOS

[Flutter documentation](https://docs.flutter.dev/deployment/flavors-ios)

1. Open the New Scheme window (Product > Scheme > New Scheme).
2. In the Target field, select Runner.
3. In the Name box, enter staging.
4. Click Okay to add the new scheme.
5. Repeat for all flavors.

_**Note**_

By default the new schemes are shared. The schemes must be shared for Flutter flavors to work properly. To double-check that sharing is enabled, open the Manage Schemes window (Product > Scheme > Manage Schemes) and make sure that the Shared checkbox to the right of your new scheme is checked.

__Create configurations for the schemes in Xcode__

6. In the project navigator, select Runner.
7. In the main window under PROJECT, select Runner.
8. Open the Info tab if it isn’t open.
9. Go to the Configurations section and add new Debug configurations. <br>
  i). Click +, select Duplicate "Debug" configuration, and name the new configuration Debug-staging.
  ii). Click +, select Duplicate "Debug" configuration, and name the new configuration Debug-production.

  Repeat the step for all flavors.

_**Note**_

The scheme name (example: staging) that is appended to a configuration name must be lowercase if you want to use it with the Flutter CLI command.

Your configurations should be based on your Debug.xcconfig, Profile.xcconfig, and Release.xcconfig files, not the Pods-Runner.xcconfig file. You can check this by expanding the configuration names in Xcode.

__Assign the configurations to the schemes in Xcode:__

7. Open the Manage Schemes window (Product > Scheme > Manage Schemes).
8. Select the staging scheme and edit it.
9. In the following tabs, update the Build Configuration field as follows:

    Run: Debug-staging<br>
    Test: Debug-staging<br>
    Profile: Profile-staging<br>
    Analyze: Debug-staging<br>
    Archive: Release-staging<br>

10. Repeat for all flavors.


## Android

In _android/app/build.gradle_ add this in android block

```kt
    flavorDimensions += "app"

    productFlavors {
        create("production") {
            dimension = "app"
            applicationIdSuffix = ".app"
            resValue("string", "app_name", "Scaffold")
        }
        create("dev") {
            dimension = "app"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "Dev")
            versionNameSuffix = "-dev"
        }
        create("staging") {
            dimension = "app"
            applicationIdSuffix = ".staging"
            resValue("string", "app_name", "Staging")
            versionNameSuffix = "-staging"
        }
    }
````

2. Update name space namespace = "com.scaffold"

3. Update package name in MainActivity.kt 
package com.scaffold
