package imgrep;

import java.util.ArrayList;

public class imgrepService {
	private imgrepDao dao;
	
	public imgrepService() {
		dao = new imgrepDao();
	}
	
	public void addRep(imgrepVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<imgrepVo> getReps(int pnum){
		return dao.selectByPnum(pnum);
	}
	
	public void delReps(int num) {
		dao.deleteByNum(num);
	}
}
