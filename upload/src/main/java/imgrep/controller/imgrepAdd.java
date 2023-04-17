package imgrep.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import imgrep.imgrepService;
import imgrep.imgrepVo;

/**
 * Servlet implementation class imgrepAdd
 */
@WebServlet("/imgrep/add")
public class imgrepAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imgrepAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
		int pnum = Integer.parseInt(request.getParameter("pnum")); // 댓글 작성하는 원글번호
		String writer = request.getParameter("writer"); // 댓글 작성자
		String content = request.getParameter("content"); // 댓글 내용
															// 담아서
		imgrepService service = new imgrepService();
		service.addRep(new imgrepVo(0, pnum, writer, content)); // 댓글추가메서드에 담기
		
		ArrayList<imgrepVo> reps = service.getReps(pnum); // 댓글 불러오기 호출해서
		JSONArray arr = new JSONArray(); // json 배열에 담고
		for(imgrepVo vo:reps) { // 호출한 댓글들 vo에 담고
			JSONObject obj = new JSONObject(); // json
			obj.put("writer", vo.getWriter()); // json에 작성자 담기
			obj.put("content", vo.getContent()); // json에 내용 담기
			arr.add(obj); // 배열
		}
		String txt = arr.toJSONString();
		response.getWriter().append(txt);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
