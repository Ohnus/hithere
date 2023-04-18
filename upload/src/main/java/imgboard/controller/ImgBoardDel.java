package imgboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imgboard.ImgBoardService;
import imgboard.ImgBoardVo;

/**
 * Servlet implementation class ImgBoardDel
 */
@WebServlet("/imgboard/del")
public class ImgBoardDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImgBoardDel() {
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
		String path = "C:\\Users\\KOSTA\\Desktop\\web_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
		int num = Integer.parseInt(request.getParameter("num"));
		ImgBoardService service = new ImgBoardService();
		ImgBoardVo vo = service.getImg(num);
		String delf = path + vo.getPath();
		File f = new File(delf);
		f.delete();//파일 삭제
		service.delImg(num);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
