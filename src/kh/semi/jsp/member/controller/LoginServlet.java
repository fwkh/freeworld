package kh.semi.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.service.MemberService;
import kh.semi.jsp.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String userId = request.getParameter("userId");
	String email = request.getParameter("email");
	
	Member m = new Member(userId,email);
	
	MemberService ms = new MemberService();
	
	try {
		m = ms.selectMember(m);
		
		System.out.println("회원 로그인 성공!");
		
		HttpSession session = request.getSession();
		session.setAttribute("member", m);
		
		response.sendRedirect("home.jsp");
		
	}catch(MemberException e) {
		request.setAttribute("msg", "회원 로그인 실패!");
		request.setAttribute("exception", e);
		
		request.getRequestDispatcher("views/common/errorPage.jsp")
		.forward(request, response);
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
