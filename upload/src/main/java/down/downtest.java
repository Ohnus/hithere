package down;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class downtest
 */
@WebServlet("/down/test")
public class downtest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public downtest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//다운로드 폴더
        String downDir = "C:\\down\\";
       
        //사용자가 클릭한 파일명
        String fname = request.getParameter("fname");
       
        String path = downDir + fname;// 다운로드할 파일 전체 경로

        //파일에 대한 정보. 파일크기, 읽기, 쓰기, 실행 가능, 존재하는지 유무....
        File file = new File(path);
       
        //다운로드 파일의 내용을 읽을 스트림 생성
        FileInputStream in = new FileInputStream(path);

        //파일명 인코딩, binary값 리턴.. 한글 파일명 깨지지 않게 인코딩처리
        fname = new String(fname.getBytes("euc-kr"), "8859_1");

        //다운로드 응답을 보내기 위한 response 설정
        //setContentType(): 파일의 마임설정. 파일의 종류 지정.
        //octet-stream: 바이너리 파일 한 종류
        response.setContentType("application/octet-stream");
        //헤더 설정. 패킷의 중요 정보를 설정. 첨부파일 전송 설정
        response.setHeader("Content-Disposition", "attachment; filename=" + fname);

        //다운로드 파일 내용을 response(페이지)에 출력할 출력 스트림 획득
        OutputStream os = response.getOutputStream();

        int length;
        //다운로드 파일에서 읽은 내용을 담을 byte배열을 파일 크기와 동일하게 생성
       int fsize = (int) file.length(); // File 클래스의 length 메서드.. 반환타입 long
        byte[] b = new byte[fsize];

        //파일에서 읽은 내용을 response에 출력.. read(1바이트씩) 메서드: 바이트 수 읽고 반환
        while ((length = in.read(b)) > 0) {
            os.write(b, 0, length);
        }
       
        //강제출력 .. 출력버퍼를 강제로 비워줌
        os.flush();

        //스트림 닫기
        os.close();
        in.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
