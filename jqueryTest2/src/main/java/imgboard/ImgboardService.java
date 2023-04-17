package imgboard;

import java.util.ArrayList;

public class ImgboardService {
	private ImgboardDao dao;
	
	public ImgboardService() {
		dao = new ImgboardDao();
	}
	
	public void addImg(ImgboardVo vo) {
		dao.insert(vo);
	}
	
	public ImgboardVo getImg(int num) {
		return dao.select(num);
	}
	
	public ArrayList<ImgboardVo> getAll(){
		return dao.selectAll();
	}
	
	public void editImg(ImgboardVo vo) {
		dao.update(vo);
	}
	
	public void delImg(int num) {
		dao.delete(num);
	}
	
}
