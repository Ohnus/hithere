package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class LoginHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "/index.jsp";
		String msg = "로그인실패";
		if (request.getMethod().equals("GET")) {//request.getMethod(): 요청 방식(get/post)값 반환
			request.setAttribute("view", "/member/login.jsp");
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(id);
			
			if(vo!=null && pwd.equals(vo.getPwd())) {//로그인 체크
				HttpSession session = request.getSession();//세션 획득
				session.setAttribute("loginId", id);//loginId는 로그아웃할때까지 세션에 남아있음			
				msg = "로그인 성공";
			}
		}
		request.setAttribute("msg", msg);
		return view;
	}

}
