package filedown;

import java.util.ArrayList;

public class FileDownService {
	private FileDownDao dao;
	public final static String downDir = "C:\\down\\";
	
	public FileDownService() {
		dao = new FileDownDao();
	}
	
	public void addFile(FileDownVo vo) {
		dao.insert(vo);
	}
	
	public FileDownVo getFile(int num) {
		return dao.select(num);
	}
	
	public ArrayList<FileDownVo> getAll(){
		return dao.selectAll();
	}
	
	public void editCnt(int num) {
		dao.updateCnt(num);
	}
}
