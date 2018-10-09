/**
 * react-native-sha512
 * @flow
 */

'use strict';

const {NativeModules} = require('react-native')
const sha512Lib = NativeModules.sha512Lib;



export default {

  sha256 :(data) => {
    return sha512Lib.sha256(data)
  },
  sha512: (data) => {
    return sha512Lib.sha512(data)
  }

}
