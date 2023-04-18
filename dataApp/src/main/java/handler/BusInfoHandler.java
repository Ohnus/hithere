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

import xml.WeatherVo;

public class BusInfoHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String urlstr = "http://ws.bus.go.kr/api/rest/busRouteInfo/getRouteInfo?ServiceKey=BYgs6%2FjSL0du1z8yK4GxYdW1SepukkJ0gXtUP3tGUQpjThEU4JeQKRlspdSnxTWcjia6U6r5oPxW%2F7tK7HZ2sg%3D%3D&busRouteId=";
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
			String busRouteNm = root.getElementsByTagName("busRouteNm").item(0).getTextContent();
			String corpNm = root.getElementsByTagName("corpNm").item(0).getTextContent();
			String edStationNm = root.getElementsByTagName("edStationNm").item(0).getTextContent();
			String stStationNm = root.getElementsByTagName("stStationNm").item(0).getTextContent();
			String firstBusTm = root.getElementsByTagName("firstBusTm").item(0).getTextContent();
			String lastBusTm = root.getElementsByTagName("lastBusTm").item(0).getTextContent();
			String term = root.getElementsByTagName("term").item(0).getTextContent();
			
			request.setAttribute("busRouteNm", busRouteNm);			
			request.setAttribute("corpNm", corpNm);			
			request.setAttribute("edStationNm", edStationNm);			
			request.setAttribute("stStationNm", stStationNm);			
			request.setAttribute("firstBusTm", firstBusTm);			
			request.setAttribute("lastBusTm", lastBusTm);			
			request.setAttribute("term", term);			
			
			
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
		return "/bus/routeinfo.jsp";
		
	}

}
