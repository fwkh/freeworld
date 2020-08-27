package kh.semi.jsp.member.exception;

public class MemberException extends Exception{
	// 사용자 정의 예의처리를 구현
	public MemberException() {
		super();
	}

	public MemberException(String msg) {
		super(msg);
	}

}
