package grails.multitenant.dbmanager.util

import javax.crypto.spec.SecretKeySpec
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import sun.misc.BASE64Encoder
import sun.misc.BASE64Decoder
import org.codehaus.groovy.grails.commons.ConfigurationHolder
/**
 *
 * This class provides a set of utilities to help with security such as encrypting passwords etc.
 */
class SecurityUtilities
{
  static BASE64Decoder decoder = new BASE64Decoder()
  static BASE64Encoder encoder = new BASE64Encoder()

  static encode = { str ->
    Cipher cipher = setupCipher(Cipher.ENCRYPT_MODE, getPassword())
    return encoder.encode(cipher.doFinal(str.getBytes()));
  }

  static decode = { str ->
    Cipher cipher = setupCipher(Cipher.DECRYPT_MODE, getPassword())
    return new String(cipher.doFinal(decoder.decodeBuffer(str)));
  }

  static getPassword()
  {
    return ConfigurationHolder.config.mtDbManager.encryption.password
  }

  private static setupCipher(mode, password)
  {
    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

    // setup key
    byte[] keyBytes = new byte[16];
    byte[] b = password?.getBytes("UTF-8");
    int len = b.length;
    if (len > keyBytes.length)
      len = keyBytes.length;
    System.arraycopy(b, 0, keyBytes, 0, len);
    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

    IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);
    cipher.init(mode, keySpec, ivSpec);
    return cipher
  }
}
