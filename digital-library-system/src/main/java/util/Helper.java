package util;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class Helper {
	public static String getLastPartOfURL(String fullURL) {
	    return fullURL.substring(fullURL.lastIndexOf("/") + 1);
	}
	
	public static String getLastPartWithoutExtension(String fullURL) {
        String lastPart = fullURL.substring(fullURL.lastIndexOf("/") + 1);

        if (lastPart.contains(".")) {
            lastPart = lastPart.substring(0, lastPart.lastIndexOf("."));
        }

        return lastPart;
    }
	
	public static String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }

        return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
    }
	
	private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES";
    private static final String KEY_SPEC = "AES";

    public static String encrypt(String password, String key) throws Exception {
        byte[] keyValue = key.getBytes();
        SecretKeySpec skeySpec = new SecretKeySpec(keyValue, KEY_SPEC);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(password.getBytes());
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public static String decrypt(String encryptedPassword, String key) throws Exception {
        byte[] keyValue = key.getBytes();
        SecretKeySpec skeySpec = new SecretKeySpec(keyValue, KEY_SPEC);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(encryptedPassword));
        return new String(decrypted);
    }

    public static String generateKey() throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance(ALGORITHM);
        kgen.init(128);
        SecretKey skey = kgen.generateKey();
        return Base64.getEncoder().encodeToString(skey.getEncoded());
    }
}
