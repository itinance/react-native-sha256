/**
 * react-native-sha256
 * @flow
 */

'use strict';

const {NativeModules} = require('react-native')
const sha256Lib = NativeModules.sha256Lib;

export function sha256(data: string) {
  return sha256Lib.sha256(data);
}

export function sha256Bytes(data: Array) {
  return sha256Lib.sha256Bytes(data);
}
 
export function sha1(data: string) {
  return sha256Lib.sha1(data);
}

export function sha1Bytes(data: Array) {
  return sha256Lib.sha1Bytes(data);
}
