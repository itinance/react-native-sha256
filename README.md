# react-native-sha512
sha512 natively for react-native

Speed is king, especially for javascript-driven applications with react-native!
This library provides native sha256-hashes for a string on both iOS and Android
natively. 

# Installation
```
yarn add react-native-sha512
react-native link
```

# Usage

Import the lib into your project:

```javascript
import { sha512 } from 'react-native-sha512';
```

Build a sha512-hash:

```javascript
sha512("Test").then( hash => {
    console.log(hash);
})
```


Forked from https://github.com/itinance/react-native-sha256

