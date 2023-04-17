package imgboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imgboard.ImgboardService;
import imgboard.ImgboardVo;

/**
 * Servlet implementation class imgboardDelete
 */
@WebServlet("/imgboard/delete")
public class imgboardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imgboardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "C:\\Users\\KOSTA\\Desktop\\WebProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";

		int num = Integer.parseInt(request.getParameter("num"));
		ImgboardService service = new ImgboardService();
		// 이미지파일 먼저 삭제 후,
		ImgboardVo vo = service.getImg(num);
//		String[] arr = vo.getPath().split("\\");
//		String fname = arr[arr.length-1];
		String delf = path + vo.getPath();
		File f = new File(delf);
		f.delete();
		// 게시글 삭제하기
		service.delImg(num);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
