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

import imgboard.ImgBoardService;
import imgboard.ImgBoardVo;

/**
 * Servlet implementation class ImgBoardAdd
 */
@WebServlet("/imgboard/add")
public class ImgBoardAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImgBoardAdd() {
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
		RequestDispatcher dis = request.getRequestDispatcher("/imgboard/add.jsp");
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

		MultipartRequest multipart = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());

		// 폼파라메터 읽기
		String writer = multipart.getParameter("writer");
		String title = multipart.getParameter("title");
		String content = multipart.getParameter("content");
		
		// 업로드된 파일의 파일객체 반환
		File f = multipart.getFile("file");
		// getName(): 파일명 반환
		String fname = "\\img\\"+f.getName();// 파일명
		
		ImgBoardService service = new ImgBoardService();
		service.addImg(new ImgBoardVo(0, writer, null, title, content, fname));
		
		response.sendRedirect(request.getContextPath()+"/imgboard/list");
	}

}
