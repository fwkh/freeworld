package kh.semi.jsp.member.encrypt;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		
		if(name != null && name.equals("userPwd")) {
			// 암호화한 값을 전달
			name = getSHA512(super.getParameter(name));
			System.out.println("암호화된 값 : " + name);
		}else {
			name = super.getParameter(name);
		}
		
		return name;
	}
	
	// 암호화를 위한 SHA512를 작성
	private static String getSHA512(String pwd) {
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512"); // 어떤 알고리즘을 쓸건지 
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8")); // 암호화값을 byte[]로 변경
			md.update(bytes); // 변환작업
			
			return Base64.getEncoder().encodeToString(md.digest());
			
		}catch(NoSuchAlgorithmException e) {
			System.out.println("암호화 에러 발생!");
			e.printStackTrace();
			
			return null;
		}
		
	}

}











