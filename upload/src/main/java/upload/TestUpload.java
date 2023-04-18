package upload;

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

/**
 * Servlet implementation class TestUpload
 */
@WebServlet("/test/upload")
public class TestUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestUpload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dis = request.getRequestDispatcher("/upload/form.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 업로드할 경로
		String path = "C:\\Users\\KOSTA\\Desktop\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";

		// 업로드 파일의 최대 크기
		int size = 100 * 1024 * 1024; // 100M

		// 업로드에 사용할 MultipartRequest 객체 생성
		// param1: 요청객체
		// param2: 업로드 경로
		// param3: 파일 최대 크기
		// param4: 인코딩
		// param5: 파일명 중복됐을때 처리 방법
		MultipartRequest multipart = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());

		// 폼파라메터 읽기
		String title = multipart.getParameter("title");
		System.out.println("title:"+title);
		// 업로드된 파일의 원본 이름
		String fname = multipart.getOriginalFileName("file");
		System.out.println("fname:"+fname);
		
		//업로드된 파일의 파일객체 반환
		File f = multipart.getFile("file");
		// getName(): 파일명 반환
		String ffname = f.getName();// 파일명
		
		File dir = new File(path);//디렉토리 정보 객체 생성
		String[] flist = dir.list();//파일 목록 반환 {"1.jpg", "2.jpg"};
		request.setAttribute("flist", flist);
		RequestDispatcher dis = request.getRequestDispatcher("/upload/list.jsp");
		dis.forward(request, response);
	}

}
