package kh.semi.jsp.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jsp.member.model.service.MemberService;
import kh.semi.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String gender = request.getParameter("genderCd");
		String phone = request.getParameter("telNo");
		String[] totalSkill = request.getParameter("skills").split(",");
		String skill1 = null;
		String skill2 = null;
		String skill3 = null;
		skill1 = totalSkill[0];
		skill2 = totalSkill[1];
		skill3 = totalSkill[2];
		String changeFuture = request.getParameter("future");
		String area = request.getParameter("area1");
		
		Date future = Date.valueOf(changeFuture);
		int birthYear = Integer.parseInt(request.getParameter("birthDay"));
		Member m= new Member();
		
		System.out.println(skill1.toString());
		System.out.println(skill2.toString());
		System.out.println(skill3.toString());

		
		// 변경된 회원정보를 전달하기 위한 vo생성
		m.setBirthYear(birthYear);
		m.setGender(gender);
		m.setPhone(phone);
		m.setSkill1(skill1);
		m.setSkill2(skill2);
		m.setSkill3(skill3);
		m.setArea(area);
		m.setFuture(future);

		// 회원가입 서비스
		MemberService ms = new MemberService();
		
		try {
			System.out.println("여기까지는 들어왔어요!");
			ms.memberUpdate(m);
			System.out.println("회원정보 수정완료");
			
			response.sendRedirect("resumeSearch.jsp");
			
		} catch (Exception e) {
			request.setAttribute("msg", "회원 가입 중 에러발생!");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
