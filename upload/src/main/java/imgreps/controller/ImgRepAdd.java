package imgreps.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import imgreps.ImgRepService;
import imgreps.ImgRepVo;

/**
 * Servlet implementation class ImgRepAdd
 */
@WebServlet("/imgrep/add")
public class ImgRepAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgRepAdd() {
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
		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		ImgRepService service = new ImgRepService();
		service.addRep(new ImgRepVo(0, pnum, writer, content));
		
		ArrayList<ImgRepVo> reps = service.getReps(pnum);
		JSONArray arr = new JSONArray();
		for(ImgRepVo vo:reps) {
			JSONObject obj = new JSONObject();
			obj.put("writer", vo.getWriter());
			obj.put("content", vo.getContent());
			arr.add(obj);
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
