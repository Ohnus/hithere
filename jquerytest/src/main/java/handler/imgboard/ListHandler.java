package handler.imgboard;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import imgboard.ImgBoardService;
import imgboard.ImgBoardVo;
import imgreps.ImgRepService;
import imgreps.ImgRepVo;

//url: /imgboard/list.do
public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ImgBoardService service = new ImgBoardService();
		ImgRepService serv = new ImgRepService();
		ArrayList<ImgBoardVo> list = service.getAll();
		for(ImgBoardVo vo:list) {
			ArrayList<ImgRepVo> reps = serv.getReps(vo.getNum());
			vo.setReps(reps);
		}
		request.setAttribute("list", list);
		request.setAttribute("view", "/imgboard/list.jsp");
		return "/index.jsp";
	}

}