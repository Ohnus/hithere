package handler.imgboard;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.Handler;
import imgboard.ImgBoardService;
import imgboard.ImgBoardVo;

//url: /imgboard/add.do
public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "/index.jsp";
		if(request.getMethod().equals("GET")) {
			request.setAttribute("view", "/imgboard/add.jsp");
		}else {
			String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";

			// 업로드 파일의 최대 크기
			int size = 100 * 1024 * 1024; // 100M

			try {
				MultipartRequest multipart = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
				// 폼파라메터 읽기
				String writer = multipart.getParameter("writer");
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");
				
				// 업로드된 파일의 파일객체 반환
				File f = multipart.getFile("file");
				// getName(): 파일명 반환
				String fname = "\\img\\"+f.getName();// 파일명
				
				ImgBoardService service = new ImgBoardService();
				service.addImg(new ImgBoardVo(0, writer, null, title, content, fname));
				
				view = "redirect:/imgboard/list.do";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}
		return view;
	}

}
