package handler;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import json.FoodVo;

public class JsonHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String path = request.getServletContext().getRealPath("/WEB-INF/files/serviceAreaFoods.json");
		try {
			FileReader fr = new FileReader(path);
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(fr);//json 파싱
			
			Iterator iter = obj.keySet().iterator();
			ArrayList<FoodVo> list = new ArrayList<>();
			while(iter.hasNext()) {
				String key = (String) iter.next();
				//음식 객체 하나를 꺼냄
				JSONObject o = (JSONObject) obj.get(key);
				
				//음식명 추출
				JSONArray arr =  (JSONArray) o.get("http://www.w3.org/2000/01/rdf-schema#label");
				JSONObject jsonlabel = (JSONObject) arr.get(0);
				String label = (String) jsonlabel.get("value");
				
				//가격 추출
				JSONArray arr2 =  (JSONArray) o.get("http://data.ex.co.kr:80/link/def/salePrice");
				JSONObject jsonprice = (JSONObject) arr2.get(0);
				String price = (String) jsonprice.get("value");
				
				//지역명 추출
				JSONArray arr3 =  (JSONArray) o.get("http://data.ex.co.kr:80/link/def/serviceAreaName");
				JSONObject jsonarea = (JSONObject) arr3.get(0);
				String area = (String) jsonarea.get("value");
				
				//고속도로명 추출
				JSONArray arr4 =  (JSONArray) o.get("http://data.ex.co.kr:80/link/def/routeName");
				JSONObject jsonroute = (JSONObject) arr4.get(0);
				String route = (String) jsonroute.get("value");
				
				//방향 추출
				JSONArray arr5 =  (JSONArray) o.get("http://data.ex.co.kr:80/link/def/direction");
				JSONObject jsondirect = (JSONObject) arr5.get(0);
				String direct = (String) jsondirect.get("value");
				
				list.add(new FoodVo(label, price, area, route, direct));
				
			}
			request.setAttribute("list", list);
			System.out.println(list);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/json/list.jsp";
	}

}
