package test;

public class memberService {
	private memberDao dao;

	public memberService() {
		dao = new memberDao();
	}

	public void updateStatus(memberVo vo) {
		dao.updateSt(vo);
	}

	public void join(memberVo vo) {
		dao.insert(vo);
	}

	public memberVo getMember(String id) {
		return dao.select(id);
	}

	public void updateMyInfo(memberVo vo) {
		dao.update(vo);
	}

	public void delMember(String id) {
		dao.delete(id);
	}
}
