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
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import xml.StationVo;

public class StationListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String urlstr = "http://ws.bus.go.kr/api/rest/busRouteInfo/getStaionByRoute?ServiceKey=BYgs6%2FjSL0du1z8yK4GxYdW1SepukkJ0gXtUP3tGUQpjThEU4JeQKRlspdSnxTWcjia6U6r5oPxW%2F7tK7HZ2sg%3D%3D&busRouteId=";
		String busid = request.getParameter("busid");
		urlstr += busid;
		try {
			URL url = new URL(urlstr);
			URLConnection conn = url.openConnection(); // 네트워크 연결
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(conn.getInputStream());
			
			Element root = doc.getDocumentElement(); // root 요소 추출
			String headercode = root.getElementsByTagName("headerCd").item(0).getTextContent();
			if(!headercode.equals("0")) {
				String errormsg = root.getElementsByTagName("headerMsg").item(0).getTextContent();
				response.getWriter().append(errormsg);
				return null;
			}
			
			ArrayList<StationVo> list= new ArrayList<>();
			NodeList stationlist = root.getElementsByTagName("itemList"); // 검색한 숫자가 포함된 모든 버스정보를 보여줌
			// itemList 태그에 한 버스의 정보가 담기므로 리스트에 itemList 정보 담아서 for문으로 검색된 숫자 포함된 버스 목록 모두 출력하기
			String busRouteNm = "";
			for(int i=0; i<stationlist.getLength(); i++) {
				Element station = (Element) stationlist.item(i);
				String seq = station.getElementsByTagName("seq").item(0).getTextContent();
				String stationNm = station.getElementsByTagName("stationNm").item(0).getTextContent();
				String direction = station.getElementsByTagName("direction").item(0).getTextContent();
				String gpsX = station.getElementsByTagName("gpsX").item(0).getTextContent();
				String gpsY = station.getElementsByTagName("gpsY").item(0).getTextContent();
				String arsId = station.getElementsByTagName("arsId").item(0).getTextContent();
								
				list.add(new StationVo(seq, stationNm, direction, gpsX, gpsY, arsId));
			}
			request.setAttribute("busRouteNm", busRouteNm);
			request.setAttribute("list", list);
			
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
		return "/bus/stationlist.jsp";
	}

}
