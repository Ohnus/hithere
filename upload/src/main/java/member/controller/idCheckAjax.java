package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.MemberService;
import member.MemberVo;

/**
 * Servlet implementation class idCheckAjax
 */
@WebServlet("/member/idcheckajax")
public class idCheckAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public idCheckAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id"); // 중복체크할 id
		MemberService service = new MemberService();
		MemberVo vo = service.getMember(id); // id로 검색
		boolean flag = (vo==null); // 중복되지 않으면 true, 아니면 false
		request.setAttribute("flag", flag); // flag: id중복여부
		JSONObject obj = new JSONObject();
		obj.put("flag", flag); // json 객체 생성해서 true, false를 넣기
		String txt = obj.toJSONString();
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
