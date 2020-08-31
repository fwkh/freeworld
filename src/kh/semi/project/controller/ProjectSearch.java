package kh.semi.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.service.MemberService;
import kh.semi.project.model.service.ProjectService;
import kh.semi.project.model.vo.Project;

/**
 * Servlet implementation class ProjectSearch
 */
@WebServlet("/projectSearch.do")
public class ProjectSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Project> list = null;
		
		System.out.println("link test");
		
		ProjectService ps = new ProjectService();
		
		try {
			list = ps.searchProject(list);
			
			System.out.println("프로젝트 검색!");
			
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
			
			response.sendRedirect("views/project/projectSearch.jsp");
			
		}catch(Exception e) {
			request.setAttribute("msg", "프로젝트 검색 실패!");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
		}
		
		request.getRequestDispatcher("views/project/projectSearch.jsp").forward(request, response);;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
