package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.MemberService;
import member.MemberVo;

/**
 * Servlet implementation class IdCheckAjax
 */
@WebServlet("/member/idchecAjax")
public class IdCheckAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");//중복체크할 id
		MemberService service = new MemberService();
		MemberVo vo = service.getMember(id);//id로 검색
		boolean flag = (vo == null);// 중복되지 않으면 true, 아니면 false	
		JSONObject obj = new JSONObject();// {}
		obj.put("flag", flag);//{"flag":true}
		String txt = obj.toJSONString();//json 문자열로 변환
		
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
