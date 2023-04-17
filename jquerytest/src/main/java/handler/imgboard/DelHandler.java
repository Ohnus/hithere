package handler.imgboard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import imgboard.ImgBoardService;
import imgboard.ImgBoardVo;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";

		int num = Integer.parseInt(request.getParameter("num"));
		ImgBoardService service = new ImgBoardService();
		ImgBoardVo vo = service.getImg(num);
		String delf = path + vo.getPath();
		File f = new File(delf);
		f.delete();
		service.delImg(num);
		return "redirect:/imgboard/list.do";
	}

}
