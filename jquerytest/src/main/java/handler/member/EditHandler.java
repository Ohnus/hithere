package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

//url: /member/edit.do
public class EditHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("euc-kr");

		String view = "/index.jsp";

		if (request.getMethod().equals("GET")) {
			String id = request.getParameter("id");
			MemberService service = new MemberService();
			MemberVo m = service.getMember(id);
			// 검색한 결과를 request에 담는다. setAttribute(이름, 값);
			request.setAttribute("m", m);
			request.setAttribute("view", "/member/edit.jsp");
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			MemberService service = new MemberService();
			service.editMyInfo(new MemberVo(id, pwd, name, ""));
			view = "redirect:/member/edit.do?id=" + id;
		}
		return view;
	}

}
