/**
 * react-native-sha512
 * @flow
 */

'use strict';

const {NativeModules} = require('react-native')
const sha512lib = NativeModules.sha512lib;




 const  sha256  = (data) => {
      return sha512lib.sha256(data)
  }

 const sha512= (data) => {
      return sha512lib.sha512(data)
  }

export { sha256 , sha512}
