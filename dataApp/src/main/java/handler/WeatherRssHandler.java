package handler;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import xml.WeatherVo;

public class WeatherRssHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String urlstr = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109";
		try {
			URL url = new URL(urlstr);
			URLConnection conn = url.openConnection(); // 네트워크 연결
			// 데이터 읽기 테스트
			// 반환된 읽기 스트림을 읽은 후 속도 올리기
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8")); // url 자원에 연결된 자원을 읽을 읽기 스트림 반환
//			StringBuilder sb = new StringBuilder();
//			String str = "";
//			while((str = br.readLine())!=null) {
//				sb.append(str+"\n"); // url에서 한줄한줄 읽어서 sb에 넣기
//				
//			}
//			str = sb.toString();
//			System.out.println(str);
//			br.close(); // 다 읽었으면 닫기
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

			// DocumentBuilder 객체 생성
			DocumentBuilder builder = factory.newDocumentBuilder();

			// xml 파싱
			Document doc = builder.parse(conn.getInputStream());
			
			Element root = doc.getDocumentElement(); // root 요소 추출
			String author = root.getElementsByTagName("author").item(0).getTextContent();
			String category = root.getElementsByTagName("category").item(0).getTextContent();
			String title = root.getElementsByTagName("title").item(1).getTextContent();
			
			System.out.println("author:"+author);
			System.out.println("category:"+category);
			System.out.println("title:"+title);
			
			ArrayList<WeatherVo> list = new ArrayList<>();
			NodeList locs = root.getElementsByTagName("location");
			for(int i=0; i<locs.getLength(); i++) {
				Element loc = (Element) locs.item(i);
				String city = loc.getElementsByTagName("city").item(0).getTextContent();
				NodeList datas = loc.getElementsByTagName("data");
				for(int j=0; j<datas.getLength(); j++) {
					Element data = (Element) datas.item(j);
					String dateTime = data.getElementsByTagName("tmEf").item(0).getTextContent();
					String info = data.getElementsByTagName("wf").item(0).getTextContent();
					String tmn = data.getElementsByTagName("tmn").item(0).getTextContent();
					String tmx = data.getElementsByTagName("tmx").item(0).getTextContent();
					String rnst = data.getElementsByTagName("rnSt").item(0).getTextContent();
					list.add(new WeatherVo(city, dateTime, info, tmn, tmx, rnst));
				}
			}
			request.setAttribute("list", list);
			request.setAttribute("author", author);
			request.setAttribute("category", category);
			request.setAttribute("title", title);
			System.out.println(list);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/xml/weatherlist.jsp";
		
	}

}