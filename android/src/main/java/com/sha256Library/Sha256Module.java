package com.sha256lib;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.util.UUID;

public class Sha256Module extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public Sha256Module(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "sha256Lib";
  }

  String buildHash(final String toHash, final String algo, final Integer length) throws NoSuchAlgorithmException, UnsupportedEncodingException {
    MessageDigest md = MessageDigest.getInstance(algo);
    md.update(toHash.getBytes("UTF-8"));
    byte[] digest = md.digest();
    return String.format("%0" + length.toString() + "x", new java.math.BigInteger(1, digest));
  }


  @ReactMethod
  public void sha256(final String toHash, Promise promise) {
      try {
          String hash = buildHash(toHash, "SHA-256", 64);
          promise.resolve(hash);
      } catch (NoSuchAlgorithmException e) {
          e.printStackTrace();
          promise.reject("sha256", e.getMessage());
      } catch (UnsupportedEncodingException e) {
          e.printStackTrace();
          promise.reject("sha256", e.getMessage());
      }
  }

  @ReactMethod
  public void sha1(final String toHash, Promise promise) {
      try {
          String hash = buildHash(toHash, "SHA-1", 40);
          promise.resolve(hash);
      } catch (NoSuchAlgorithmException e) {
          e.printStackTrace();
          promise.reject("sha1", e.getMessage());
      } catch (UnsupportedEncodingException e) {
          e.printStackTrace();
          promise.reject("sha1", e.getMessage());
      }
  }

}
