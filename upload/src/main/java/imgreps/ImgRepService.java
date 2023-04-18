package imgreps;

import java.util.ArrayList;

public class ImgRepService {
	private ImgRepDao dao;
	public ImgRepService() {
		dao = new ImgRepDao();
	}
	
	public void addRep(ImgRepVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<ImgRepVo> getReps(int pnum){
		return dao.selectByPnum(pnum);
	}
}
