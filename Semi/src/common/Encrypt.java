package common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Encoder;

public class Encrypt {
	
	public static String getEncryptPwd(String value) {
		
		String encValue = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			
			byte[] bytes = value.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			Encoder encoder = Base64.getEncoder();				
			encValue = encoder.encodeToString(md.digest());
		
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return encValue;
	}
}

