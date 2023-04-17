package imgboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imgboard.ImgboardService;
import imgboard.ImgboardVo;
import imgrep.imgrepService;
import imgrep.imgrepVo;

/**
 * Servlet implementation class imgboardList
 */
@WebServlet("/imgboard/list")
public class imgboardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public imgboardList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		ImgboardService service = new ImgboardService();
		imgrepService serv = new imgrepService();
		ArrayList<ImgboardVo> list = service.getAll();
		for(ImgboardVo vo:list) {
			ArrayList<imgrepVo> reps = serv.getReps(vo.getNum());
			vo.setReps(reps);
		}
		request.setAttribute("list", list);

		RequestDispatcher dis = request.getRequestDispatcher("/imgboard/list.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
