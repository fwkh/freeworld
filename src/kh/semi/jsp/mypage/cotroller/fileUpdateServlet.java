package kh.semi.jsp.mypage.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.jsp.member.model.vo.Member;

/**
 * Servlet implementation class fileUpdateServlet
 */
@WebServlet("/fileUpdate.bo")
public class fileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://www.servlets.com/cos/ --> 사이트에서 cos.jar파일을 WEB-INF/lib 에 추가
				// 1. 전송할 파일의 최대 크기 설정
				// 1)10MB -> Byte 크기로 변환
				//   1024 byte= 1KB  , 1024KB = 1MB
				//   그러므로 10MB = 1024 *1024 *10
				int maxSize = 1024*1024*10; // 10MB
				
				// 2. 일반폼 형태가 아닌 파일 전송형태의 폼태그(multipart/form-data) 적용 확인
				if(!ServletFileUpload.isMultipartContent(request)) { // true/false형식으로 반환
					// 만약 올바른 mulitpart/form-data로 전송되지 않았을 경우 에러페이지로 이동시킨다.
					request.setAttribute("msg", "mulitpart를 통한 전송이 아닙니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
				}
				
				// 3. 웹 상의 루트(최상위)경로 를 활용하여 어느 곳에 저장할 것인지 지정한다.(확인)
				String root = request.getServletContext().getRealPath("/"); //C:\webWorkspace\firstWebProject1\Web\
				System.out.println("최상위 경로 : "+ root);
				
				// 4. 게시판의 첨부파일을 저장할 폴더이름 지정
				String savePath = root+"resources/boardUploadFiles";
				
				// 5.  실제 담아온 파일 기타정보들을 활용하여 request ->MultipartRequest로 형변환
				//		 MultipartRequest 생성하기
				MultipartRequest mrequest = new MultipartRequest(
																request		// 변경하기 위한 원본 객체
																, savePath 	// 파일저장 경로
																, maxSize	// 저장할 파일의 최대 크기
																, "UTF-8"	// 저장할 문자셋 설정
																, new DefaultFileRenamePolicy()
																// 동일한 이름의 파일을 저장했을 경우에
																// 기존의 파일과 구분하기 위해
																// 새로운 파일명 뒤에 숫자를 붙이도록 규칙을 만들었다.
																); 
				// 파일 업로드 시작!!
				
				
				
				String fileName = mrequest.getFilesystemName("file"); // "file" = > input태그의 이름 
				
				Member m = new Member();
				m.setFiles(fileName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
