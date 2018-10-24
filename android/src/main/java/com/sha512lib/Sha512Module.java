package com.sha512lib;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Sha512Module extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public Sha512Module(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "sha512lib";
  }

  @ReactMethod
  public void sha256(final String toHash, Promise promise) {
      MessageDigest md = null;
      try {
          md = MessageDigest.getInstance("SHA-256");
          md.update(toHash.getBytes("UTF-8"));
          byte[] digest = md.digest();
          String hash = String.format("%064x", new java.math.BigInteger(1, digest));
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
    public void sha512(final String toHash, Promise promise) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-512");
            md.update(toHash.getBytes("UTF-8"));
            byte[] digest = md.digest();
            String hash = String.format("%064x", new java.math.BigInteger(1, digest));
            promise.resolve(hash);

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            promise.reject("sha512", e.getMessage());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            promise.reject("sha512", e.getMessage());
        }
    }


}
