package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class JoinHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 요청 처리에 사용할 req, res를 파람으로 받고, 결과페이지 경로를 리턴값으로 반환
		// TODO Auto-generated method stub
		String view = "";
		if (request.getMethod().equals("GET")) {//request.getMethod(): 요청 방식(get/post)값 반환
			request.setAttribute("view", "/member/join.jsp");
			view = "/index.jsp";
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");

			MemberService service = new MemberService();
			service.join(new MemberVo(id, pwd, name, email));
			view = "redirect:/index.jsp";
		}
		return view;
	}

}
