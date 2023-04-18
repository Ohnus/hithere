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

import xml.BusVo;

public class BusRouteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String urlstr = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=BYgs6%2FjSL0du1z8yK4GxYdW1SepukkJ0gXtUP3tGUQpjThEU4JeQKRlspdSnxTWcjia6U6r5oPxW%2F7tK7HZ2sg%3D%3D&strSrch=";
		String busnm = request.getParameter("busnm");
		urlstr += busnm;
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
			
			ArrayList<BusVo> list= new ArrayList<>();
			NodeList items = root.getElementsByTagName("itemList"); // 검색한 숫자가 포함된 모든 버스정보를 보여줌
			// itemList 태그에 한 버스의 정보가 담기므로 리스트에 itemList 정보 담아서 for문으로 검색된 숫자 포함된 버스 목록 모두 출력하기
			for(int i=0; i<items.getLength(); i++) {
				Element item = (Element) items.item(i);
				String busRouteId = item.getElementsByTagName("busRouteId").item(0).getTextContent();
				String busRouteNm = item.getElementsByTagName("busRouteNm").item(0).getTextContent();
				String corpNm = item.getElementsByTagName("corpNm").item(0).getTextContent();
				String edStationNm = item.getElementsByTagName("edStationNm").item(0).getTextContent();
				String stStationNm = item.getElementsByTagName("stStationNm").item(0).getTextContent();
				String firstBusTm = item.getElementsByTagName("firstBusTm").item(0).getTextContent();
				String lastBusTm = item.getElementsByTagName("lastBusTm").item(0).getTextContent();
				String term = item.getElementsByTagName("term").item(0).getTextContent();
								
				list.add(new BusVo(busRouteId, busRouteNm, corpNm, edStationNm, stStationNm, firstBusTm, lastBusTm, term));
			}
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
		return "/bus/busroute.jsp";
	}
}
