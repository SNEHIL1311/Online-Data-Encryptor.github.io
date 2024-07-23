package p1;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class encrypt{
	private static String getSalt() 
		    throws NoSuchAlgorithmException, NoSuchProviderException 
		{
		    // Always use a SecureRandom generator
		    SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "SUN");

		    // Create array for salt
		    byte[] salt = new byte[16];

		    // Get a random salt
		    sr.nextBytes(salt);

		    // return salt
		    return salt.toString();
		}
	public String mdencrypt(String data) {
	    String generatedPassword = null;

	    try 
	    {
	      // Create MessageDigest instance for MD5
	      MessageDigest md = MessageDigest.getInstance("MD5");

	      // Add password bytes to digest
	      md.update(data.getBytes());

	      // Get the hash's bytes
	      byte[] bytes = md.digest();

	      // This bytes[] has bytes in decimal format. Convert it to hexadecimal format
	      StringBuilder sb = new StringBuilder();
	      for (int i = 0; i < bytes.length; i++) {
	        sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
	      }

	      // Get complete hashed password in hex format
	      generatedPassword = sb.toString();
	    } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
	    }
		return generatedPassword;
	}
	public String shencrypt(String data) throws NoSuchAlgorithmException, NoSuchProviderException {
        String salt = getSalt();
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(salt.getBytes());
            byte[] bytes = md.digest(data.getBytes());
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16)
                        .substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
	}
	public String pbencrypt(String data) throws NoSuchAlgorithmException, InvalidKeySpecException {
		String  originalPassword = "password";

	    String generatedSecuredPasswordHash 
	        = generateStorngPasswordHash(originalPassword);
	    return generatedSecuredPasswordHash;
	}
	private static String generateStorngPasswordHash(String password) 
		    throws NoSuchAlgorithmException, InvalidKeySpecException
		{
		    int iterations = 1000;
		    char[] chars = password.toCharArray();
		    byte[] salt = getSaltP();

		    PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
		    SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

		    byte[] hash = skf.generateSecret(spec).getEncoded();
		    return iterations + ":" + toHex(salt) + ":" + toHex(hash);
		}

		private static byte[] getSaltP() throws NoSuchAlgorithmException
		{
		    SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		    byte[] salt = new byte[16];
		    sr.nextBytes(salt);
		    return salt;
		}

		private static String toHex(byte[] array) throws NoSuchAlgorithmException
		{
		    BigInteger bi = new BigInteger(1, array);
		    String hex = bi.toString(16);
		    
		    int paddingLength = (array.length * 2) - hex.length();
		    if(paddingLength > 0)
		    {
		        return String.format("%0"  +paddingLength + "d", 0) + hex;
		    }else{
		        return hex;
		    }
		}
}