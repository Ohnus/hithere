package handler;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import csv.Vo;

//csv 파일 파싱해서 웹 페이지에 데이터를 출력
public class CsvHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//웹에서 사용될 실제 주소로 변경
		String path = request.getServletContext().getRealPath("/WEB-INF/files/a_utf8.csv");
		try {
			//문자단위로 읽는 스프림 생성
			FileReader fr = new FileReader(path);
			
			//파일에서 읽은 데이터 저장할 배열 생성
			char[] buf = new char[10000];
			
			// buf 크기만큼 파일에서 읽어서 buf에 저장
			fr.read(buf);

			String str = new String(buf);// char[]을 String으로 변환
			String[] data = str.split("\n");// 배열 하나에 한줄
			String[] titles = data[0].split(",");
			ArrayList<Vo> list = new ArrayList<>();
			for (int i = 1; i < data.length; i++) {// 1번줄에서 끝줄까지
				String[] vals = data[i].split(",");
				if(vals.length<12) {
					continue;
				}
				list.add(new Vo(vals[0],vals[1],vals[2],vals[3],vals[4],vals[5],vals[6],vals[7],
						vals[8],vals[9],vals[10],vals[11]));
			}
			request.setAttribute("titles", titles);
			request.setAttribute("list", list);
			fr.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/csv/list.jsp";
	}

}
