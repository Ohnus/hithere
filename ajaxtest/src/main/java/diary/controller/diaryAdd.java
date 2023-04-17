package diary.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import diary.diaryService;
import diary.diaryVo;

/**
 * Servlet implementation class diaryAdd
 */
@WebServlet("/diary/add")
public class diaryAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public diaryAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 작성폼을 줌, 페이지 이동은 index.jsp, request에 view이름으로 경로!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
		request.setAttribute("view", "/diary/diaryform.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("/index.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
        String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\diary";
        
        //업로드 파일의 최대 크기
        int size = 100 * 1024 * 1024; // 100M

        // 업로드에 사용할 MultipartRequest 객체 생성
        //param1: 요청객체
        //param2: 업로드 경로
        //param3: 파일 최대 크기
        //param4: 인코딩
        //param5: 파일명 중복됐을때 처리 방법
        MultipartRequest multipart = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());

        //폼파라메터 읽기
        String writer = multipart.getParameter("writer");
        String content = multipart.getParameter("content");
        //업로드된 파일의 원본 이름

        //업로드된 파일의 파일객체 반환
        File f1 = multipart.getFile("pic1");
        File f2 = multipart.getFile("pic2");
        File f3 = multipart.getFile("pic3");
        //getName(): 파일명 반환
        String fname1 = "\\diary\\nopic.png";
        String fname2 = "\\diary\\nopic.png";
        String fname3 = "\\diary\\nopic.png";
        
        if(f1 != null) {
        	fname1 = "\\diary\\" + f1.getName();
        }
        if(f2 != null) {
        	fname1 = "\\diary\\" + f2.getName();
        }
        if(f3 != null) {
        	fname1 = "\\diary\\" + f3.getName();
        }
        
        diaryService service = new diaryService();
        service.add(new diaryVo(0, writer, null, content, fname1, fname2, fname3));
        
        response.sendRedirect(request.getContextPath()+"/diary/list");
	}

}
