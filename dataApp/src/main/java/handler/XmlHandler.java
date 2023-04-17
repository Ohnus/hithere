package handler;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
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

import xml.BookVo;

public class XmlHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String path = request.getServletContext().getRealPath("/WEB-INF/files/data.xml");
		try {
			FileInputStream fi = new FileInputStream(path);
			// DocumentBuilder 객체를 주는 factory객체 생성
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			// DocumentBuilder 객체 생성
			DocumentBuilder builder = factory.newDocumentBuilder();
			// xml 파싱
			Document doc = builder.parse(fi);
			// 1. root 요소를 뽑는다. <books>
			Element root = doc.getDocumentElement();
			// 2. 자식 노드 추출 <book>태그 모두 추출
			NodeList list = root.getChildNodes();
			ArrayList<BookVo> datas = new ArrayList<>();
			for(int i=0; i<list.getLength(); i++) {
				Node child = list.item(i); // item(i): nodelist에서 i번째 노드 추출, <book>
				NodeList infos = child.getChildNodes(); // <book>의 자식노드를 추출
				if(infos.getLength()==0) {
					continue;
				}
				BookVo vo = new BookVo();
				for(int j=0; j<infos.getLength(); j++) {
					Node info = infos.item(j);
					String tagName = info.getNodeName(); // getNodeName(): 태그명 추출
					switch(tagName) {
					case "bookid":
						vo.setNum(Integer.parseInt(info.getTextContent()));
						break;
					case "title":
						vo.setTitle(info.getTextContent());
						break;
					case "author":
						vo.setAuthor(info.getTextContent());
						break;
					case "price":
						vo.setPrice(Integer.parseInt(info.getTextContent()));
						break;
					}
				}
				System.out.println(vo);
				datas.add(vo);
			}
			request.setAttribute("datas", datas);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/xml/list.jsp";
	}

}
