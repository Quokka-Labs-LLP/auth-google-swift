# auth-google-swift


* This swift package supports minimum iOS version upto iOS 13. 

* It is using GoogleSignIn , the official sdk for google-auth in iOS.

* It will handle Google-Sign-In process and handle success and failure cases and will also give you logs about the status.

* Compatible for both Uikit and SwiftUI projects


## Installation

To import this swift-package

```bash
   Go to -> Add Packages in Xcode and import code from main branch or paste this link
   https://github.com/Quokka-Labs-LLP/auth-google-swift/tree/main
```
    
## Authors

- QuokkaLabs


## Requirements
Get an OAuth client ID (Your app needs an OAuth client ID to identify itself to Google's authentication backend.)
## Configure your application project
Follow these steps to Configure your project to use google-sign-in capablities.

* Update your app's Info.plist file to add your OAuth client ID and a custom URL scheme based on the reversed client ID.

* The reversed client ID is your client ID with the order of the dot-delimited fields reversed. For example -com.googleusercontent.apps.1234567890-abcdefg

```xml
<key>GIDClientID</key>
<string>YOUR_IOS_CLIENT_ID</string>
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>YOUR_DOT_REVERSED_IOS_CLIENT_ID</string>
    </array>
  </dict>
</array>


## Documentation
For more understanding how to configure app and update info.plist file refere below Documentation

[Documentation](https://developers.google.com/identity/sign-in/ios/start-integrating)

