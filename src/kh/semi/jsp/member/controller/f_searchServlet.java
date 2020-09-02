package kh.semi.jsp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jsp.member.model.vo.Member;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/f_search.me")
public class f_searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public f_searchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int userNo = Integer.parseInt(request.getParameter("F_NO"));
		String userName = request.getParameter("F_NAME");
		String birth = request.getParameter("F_BIRTH");
		String phone = request.getParameter("F_PHONE");
		String email = request.getParameter("F_EMAIL");
		String area = request.getParameter("F_AREA");
		String hope = request.getParameter("F_HOPE");
		String future = request.getParameter("F_FUTURE");
		String withdraw = request.getParameter("F_WITHDRAW_YN");
		String enrolldate = request.getParameter("F_ENROLLDATE");
		int career = Integer.parseInt(request.getParameter("F_CAREER"));
		int totalCareer = Integer.parseInt(request.getParameter("F_TOTAL"));
		String join = request.getParameter("F_JOIN");
		String firstSkill = request.getParameter("F_SKILL1");
		String secondSkill = request.getParameter("F_SKILL2");
		String thirdSkill = request.getParameter("F_SKILL3");
		
		ArrayList<Member> freelancer = new ArrayList<>();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}