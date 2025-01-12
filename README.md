# Insomnia Cordova Plugin

This plugin prevents the screen of the mobile device from falling asleep.

## Installation

To install the plugin, use the following command:

```sh
cordova plugin add cordova-plugin-insomnia
```

## Usage

### Android

To use the plugin on Android, you need to add the following permissions to your `AndroidManifest.xml` file:

```xml
<uses-permission android:name="android.permission.WAKE_LOCK" />
```

### iOS

To use the plugin on iOS, you need to add the following permissions to your `Info.plist` file:

```xml
<key>UIBackgroundModes</key>
<array>
  <string>audio</string>
</array>
```

## Methods

### keepAwake

Prevents the screen from falling asleep.

```js
window.plugins.insomnia.keepAwake(successCallback, errorCallback);
```

### allowSleepAgain

Allows the screen to fall asleep again.

```js
window.plugins.insomnia.allowSleepAgain(successCallback, errorCallback);
```

## Example

```js
document.addEventListener('deviceready', function () {
  window.plugins.insomnia.keepAwake(
    function () {
      console.log('Screen will stay awake');
    },
    function (error) {
      console.error('Error: ' + error);
    }
  );

  // To allow the screen to sleep again
  window.plugins.insomnia.allowSleepAgain(
    function () {
      console.log('Screen can sleep again');
    },
    function (error) {
      console.error('Error: ' + error);
    }
  );
}, false);
```

## License

This project is licensed under the MIT License.
