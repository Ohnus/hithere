package imgrep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class imgrepDao {
	DBConnect dbconn;

	public imgrepDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(imgrepVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into img_reps values(seq_img_reps.nextval, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPnum());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 추가되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public ArrayList<imgrepVo> selectByPnum(int pnum) { // 원글번호로 검색해야 원글에 달린 댓글 추출 가능함
		Connection conn = dbconn.conn();
		ArrayList<imgrepVo> list = new ArrayList<>();
		String sql = "select * from img_reps where pnum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new imgrepVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public void deleteByNum(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete from img_reps where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int num2 = pstmt.executeUpdate();
			System.out.println(num2 + "줄이 삭제되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
