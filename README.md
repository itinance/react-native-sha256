# react-native-sha256
sha256 natively for react-native

Speed is king, especially for javascript-driven applications with react-native!
This library provides native sha256-hashes for a string on both iOS and Android
natively. 

# Installation
```
yarn add react-native-sha256
react-native link
```

## Adding with CocoaPods

Add the RNSha256 pod to your list of application pods in your Podfile, using the path from the Podfile to the installed module:

```
pod 'RNSha256', :path => '../node_modules/react-native-sha256'
```

Install pods as usual:
```
pod install
```

# Usage

Import the lib into your project:

```javascript
import { sha256 } from 'react-native-sha256';
```

Build a sha256-hash:

```javascript
sha256("Test").then( hash => {
    console.log(hash);
})
```

# File-Hashes

If you need to calculate SHA-256 hashes from a file, use this method of react-native-fs:
(https://github.com/itinance/react-native-fs#hashfilepath-string-algorithm-string-promisestring)