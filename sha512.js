/**
 * react-native-sha512
 * @flow
 */

'use strict';

const {NativeModules} = require('react-native')
const sha512lib = NativeModules.sha512lib;
console.warn(Object.keys(NativeModules))


export default {


    sha256 :(data) => {
        return sha512lib.sha256(data)
    },

    sha512: (data) => {
        return sha512lib.sha512(data)
    }

}
