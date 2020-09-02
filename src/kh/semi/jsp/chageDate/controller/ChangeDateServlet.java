package kh.semi.jsp.chageDate.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jsp.chageDate.model.service.ChangeDateService;
import kh.semi.jsp.member.model.vo.Member;

/**
 * Servlet implementation class ChangeDateServlet
 */
@WebServlet("/chageDate")
public class ChangeDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member user = (Member)session.getAttribute("member");
		int userNo = user.getUserNo();
		Date future = user.getFuture();
		
		Member m = new Member();
		m.setUserNo(userNo);
		m.setFuture(future);
		// 9. 서비스 결과 처리
		int result = new ChangeDateService().FutureUpdate(m);
		
		if(result >0) {
			response.sendRedirect("resumeSearch.jsp"); 
		}else {
			request.setAttribute("msg", "파일 업로드 실패!");
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
