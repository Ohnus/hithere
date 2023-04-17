package imgboard.controller;

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

import imgboard.ImgboardService;
import imgboard.ImgboardVo;

/**
 * Servlet implementation class imgboardAdd
 */
@WebServlet("/imgboard/add")
public class imgboardAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imgboardAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
		RequestDispatcher dis = request.getRequestDispatcher("/imgboard/add.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
        String path = "C:\\Users\\KOSTA\\Desktop\\WebProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
        
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
        String title = multipart.getParameter("title");
        String content = multipart.getParameter("content");
        //업로드된 파일의 원본 이름

        //업로드된 파일의 파일객체 반환
        File f = multipart.getFile("file");
        //getName(): 파일명 반환
        String fname = "\\img\\" + f.getName();//파일명
        
        ImgboardService service = new ImgboardService();
        service.addImg(new ImgboardVo(0, writer, null, title, content, fname));
        
        response.sendRedirect(request.getContextPath()+"/imgboard/list");
	}
}
