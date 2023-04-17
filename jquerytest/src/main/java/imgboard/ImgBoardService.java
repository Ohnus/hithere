package imgboard;

import java.util.ArrayList;

public class ImgBoardService {
	private ImgBoardDao dao;
	
	public ImgBoardService() {
		dao = new ImgBoardDao();
	}
	
	public void addImg(ImgBoardVo vo) {
		dao.insert(vo);
	}
	
	public ImgBoardVo getImg(int num) {
		return dao.select(num);
	}
	
	public ArrayList<ImgBoardVo> getAll(){
		return dao.selectAll();
	}
	
	public void editImg(ImgBoardVo vo) {
		dao.update(vo);
	}
	
	public void delImg(int num) {
		dao.delete(num);
	}
}
