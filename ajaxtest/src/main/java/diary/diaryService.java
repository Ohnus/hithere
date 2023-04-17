package diary;

import java.util.ArrayList;

public class diaryService {
	private diaryDao dao;
	public final String path="C:\\Users\\KOSTA\\Desktop\\WebProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\diary";
	
	public diaryService() {
		dao = new diaryDao();
	}
	
	public void add(diaryVo vo) {
		dao.insert(vo);
	}
	
	public diaryVo getByNum(int num) {
		return dao.select(num);
	}
	
	public ArrayList<diaryVo> getAll(String writer){
		return dao.selectAll(writer);
	}
	
	public void editDiary(String content, int num) {
		dao.update(content, num);
	}
	
	public void delDiary(int num) {
		dao.delete(num);
	}
}