<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This Flutter package facilitates obtaining both background and foreground location updates. It empowers developers to seamlessly integrate location-aware features into their applications, ensuring accurate positioning data whether the app is active on-screen or running in the background.

## Features

Foreground and Background Geolocation: Track device location accurately whether the app is active on-screen or running in the background.
Customizable Parameters: Configure update intervals, accuracy thresholds, and other settings to suit specific application needs.
Battery Efficiency: Implement efficient location tracking strategies to optimize battery consumption.
Platform Support: Compatible with Android and iOS platforms.

## Getting started

Add this to your package's pubspec.yaml file:

dependencies:
  location_package: ^0.0.1

Android 
To use location background mode on Android, you have to use the enableBackgroundMode({bool enable}) API before accessing location in the background and adding necessary permissions. You should place the required permissions in your applications

    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>


Remember that the user has to accept the location permission to always allow to use the background location. The Android 11 option to always allow is not presented on the location permission dialog prompt. The user has to enable it manually from the app settings. This should be explained to the user on a separate UI that redirects the user to the app's location settings managed by the operating system. More on that topic can be found on Android developer pages.

iOS 
And to use it in iOS, you have to add this permission in Info.plist :

    // This is probably the only one you need. Background location is supported
    // by this -- the caveat is that a blue badge is shown in the status bar
    // when the app is using location service while in the background.
     NSLocationWhenInUseUsageDescription

    // Deprecated, use NSLocationAlwaysAndWhenInUseUsageDescription instead.
    NSLocationAlwaysUsageDescription

    // Use this very carefully. This key is required only if your iOS app
    // uses APIs that access the user’s location information at all times,
    // even if the app isn't running.
    NSLocationAlwaysAndWhenInUseUsageDescription

To receive location when application is in background, to Info.plist you have to add property list key :

UIBackgroundModes

with string value:

location








## Usage

Then you just have to import the package with

    import 'package:location_package/location_package.dart';




```dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LocationService locationService;

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
  }

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Service Demo'),
      ),
      body: Center(
        child: Text('Location service is running...'),
      ),
    );
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
