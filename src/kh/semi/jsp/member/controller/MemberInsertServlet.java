package kh.semi.jsp.member.controller;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.service.MemberService;
import kh.semi.jsp.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public MemberInsertServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String userName = request.getParameter("name");
        String userPwd = request.getParameter("pwd");
        String hope = request.getParameter("sector_hope_ch");
        String area = request.getParameter("sector_area");
        String phone = request.getParameter("tel1") + "-"  // 010-1234-1234
                + request.getParameter("tel2") + "-"
                + request.getParameter("tel3");
        // tech1,2,3 은 회원가입시 들어가지 않음. 총합 경력만 들어감
        String tech1 = request.getParameter("tech1");
        String tech2 = request.getParameter("tech2");
        String tech3 = request.getParameter("tech3");

        int total = Integer.parseInt(request.getParameter("tech1_year")
                + request.getParameter("tech2_year")
                + request.getParameter("tech3_year"));


        // JS를 이용한 객체에는 날짜가 String 형태로 들어감.
        // 리퀘스트를 이용해 가져온 String birth ,투입날짜를 Member.java 내부 형식에 맞게 sql.Date 형식으로 바꿔주는 부분

        String s_birth = request.getParameter("birth");
        System.out.println("날짜 전달 확인 : " + s_birth);

        Date d_birth = null;
        if(s_birth !="" && s_birth !=null){
            // 날짜가 들어왔다면
            // 2020-08-18 --> 2020, 08, 18
            String[] s_birthArr = s_birth.split("-");
            int[] intArr = new int[s_birthArr.length];

            // String -> int
            for (int i=0; i<s_birthArr.length ; i++){
                intArr[i] = Integer.parseInt(s_birthArr[i]);
            }
            d_birth = new Date(new GregorianCalendar(intArr[0], intArr[1]-1,intArr[2])
            .getTimeInMillis());
        }

        String s_future= request.getParameter("date");
        System.out.println("날짜 전달 확인 : " + s_future);

        Date d_future = null;
        if(s_future !="" && s_future !=null){
            // 날짜가 들어왔다면
            // 2020-08-18 --> 2020, 08, 18
            String[] s_futureArr = s_future.split("-");
            int[] intArr = new int[s_futureArr.length];

            // String -> int
            for (int i=0; i<s_futureArr.length ; i++){
                intArr[i] = Integer.parseInt(s_futureArr[i]);
            }
            d_future = new Date(new GregorianCalendar(intArr[0], intArr[1]-1,intArr[2])
                    .getTimeInMillis());
        }
//        java.sql.Date birth = java.sql.Date.valueOf(request.getParameter("birth"));
//        java.sql.Date future = java.sql.Date.valueOf(request.getParameter("date"));
        // enrolldate는 config 에서 default값으로 넣기

        // 회원 가입 시 전달하기 위한 vo 생성
        Member m = new Member(userPwd, userName, d_birth, phone, email, area, hope, d_future, total);

        System.out.println("가입 회원 정보 확인 : " + m);
        // 회원 가입 서비스
        MemberService ms = new MemberService();

        try {
            ms.insertMember(m);
            System.out.println("회원 가입 완료");

            response.sendRedirect("index.jsp");
        } catch (MemberException e) {
            request.setAttribute("msg", "회원 가입 중 에러 발생!");
            request.setAttribute("exception", e);
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

        }
    }

}
