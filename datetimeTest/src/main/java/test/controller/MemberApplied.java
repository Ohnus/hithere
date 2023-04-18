package test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.memberService;
import test.memberVo;

/**
 * Servlet implementation class MemberApplied
 */
@WebServlet("/member/applied")
public class MemberApplied extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberApplied() {
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
		String id = request.getParameter("id");
		memberService service = new memberService();
		memberVo m = service.getMember(id); // service getMember메서드로 id 보내서 dao.select(id) 검색 후 vo 담기
		// 검색한 결과를 request에 담는다. setAttribute(이름, 값);
		request.setAttribute("m", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("/member/applied.jsp");
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
		doGet(request, response);
	}

}
