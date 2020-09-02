package kh.semi.jsp.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.service.MemberService;
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
		Boolean withdraw = Boolean.parseBoolean(request.getParameter("F_WITHDRAW_YN"));
		String enrolldate = request.getParameter("F_ENROLLDATE");
		int career = Integer.parseInt(request.getParameter("F_CAREER"));
		int totalCareer = Integer.parseInt(request.getParameter("F_TOTAL"));
		String join = request.getParameter("F_JOIN");
		String firstSkill = request.getParameter("F_SKILL1");
		String secondSkill = request.getParameter("F_SKILL2");
		String thirdSkill = request.getParameter("F_SKILL3");
		
		Date f_birth = null;
		Date f_future = null;
		Date f_enroll = null;
		
		if(birth != "" && birth != null)
		{
			// 날짜가 들어왔다면
			// 2020-01-18 --> 2020, 08, 18
			String[] dateArr = birth.split("-");
			int[] intArr = new int[dateArr.length];
			
			// String --> int
			for(int i = 0; i < dateArr.length; i++)
			{
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			f_birth = new Date(new GregorianCalendar(intArr[0], intArr[1] - 1, intArr[2]).getTimeInMillis());
		}
		else
		{
			// 날짜가 들어오지 않았다면 현재 날짜 기준으로 전달
			f_birth = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		if(future != "" && future != null)
		{
			// 날짜가 들어왔다면
			// 2020-01-18 --> 2020, 08, 18
			String[] dateArr = future.split("-");
			int[] intArr = new int[dateArr.length];
			
			// String --> int
			for(int i = 0; i < dateArr.length; i++)
			{
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			f_future = new Date(new GregorianCalendar(intArr[0], intArr[1] - 1, intArr[2]).getTimeInMillis());
		}
		else
		{
			// 날짜가 들어오지 않았다면 현재 날짜 기준으로 전달
			f_future = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		if(enrolldate != "" && enrolldate != null)
		{
			// 날짜가 들어왔다면
			// 2020-01-18 --> 2020, 08, 18
			String[] dateArr = enrolldate.split("-");
			int[] intArr = new int[dateArr.length];
			
			// String --> int
			for(int i = 0; i < dateArr.length; i++)
			{
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			f_enroll = new Date(new GregorianCalendar(intArr[0], intArr[1] - 1, intArr[2]).getTimeInMillis());
		}
		else
		{
			// 날짜가 들어오지 않았다면 현재 날짜 기준으로 전달
			f_enroll = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		
		Member m = new Member(userNo, userName, f_birth, phone, email, area, hope, f_future, withdraw, f_enroll, career, totalCareer, join, firstSkill, secondSkill, thirdSkill);
		
		try
		{
			m = new MemberService().f_searchOne(m);
			System.out.println("회원 정보 검색 성공");
			request.setAttribute("m", m);
		} 
		catch (MemberException e) 
		{
			e.printStackTrace();
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