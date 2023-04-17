package handler.imgboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import imgboard.ImgBoardService;
import imgboard.ImgBoardVo;

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
		response.setContentType("text/html; charset=EUC-KR");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		ImgBoardService service = new ImgBoardService();
		service.editImg(new ImgBoardVo(num, null, null, title, content, null));
		
		ImgBoardVo vo = service.getImg(num); // 위에서 수정완료하고 수정완료된 글을 다시 불러야함!
		JSONObject obj = new JSONObject();
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());
		String txt = obj.toJSONString();
		return "responsebody/" + txt;
	}

}
