package filedown;

import java.util.ArrayList;

public class filedownService {
	private filedownDao dao;
	
	public filedownService() {
		dao = new filedownDao();
	}
	
	public void add(filedownVo vo) {
		dao.insert(vo);
	}
	
	public filedownVo getByNum(int num) {
		return dao.select(num);
	}
	
	public ArrayList<filedownVo> getAll(){
		return dao.selectAll();
	}
}