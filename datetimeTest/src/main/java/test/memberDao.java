package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class memberDao {
	DBConnect dbconn;
	
	public memberDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void updateSt(memberVo vo) {
		Connection conn = dbconn.conn();
		String update = "update membertest set status = ? where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(update);
			pstmt.setString(1, vo.getStatus());
			pstmt.setString(2, vo.getId());
			int num = pstmt.executeUpdate();
			System.out.println(vo.getId() + "님의 정보가 수정되었습니다.");
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
	
	public memberVo select(String id) {
		memberVo vo = null; // 검색 결과 5개 담을 변수
		Connection conn = dbconn.conn();
		String sql = "select * from membertest where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery(); // executeQuery(): select문 실행 메서드, 검색 결과를 ResultSet에 담아서 반환
			while(rs.next()) { // 반환값이 true이면 이동한 줄에 읽을 데이터가 있다는 의미
				vo = new memberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
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
		return vo;
	}

	// 회원가입
	public void insert(memberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into membertest(id, pwd, name, email) values(?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 생성되었습니다.");
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

	// id 검색해서 정보 수정
	public void update(memberVo vo) {
		Connection conn = dbconn.conn();
		String update = "update membertest set pwd = ?, name = ? where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(update);
			pstmt.setString(3, vo.getId());
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			int num = pstmt.executeUpdate();
			System.out.println(vo.getId() + "님의 정보가 수정되었습니다.");
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

	// id 검색해서 삭제(탈퇴)
	public void delete(String id) {
		Connection conn = dbconn.conn();
		String delete = "delete from membertest where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(delete);
			pstmt.setString(1, id);
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 삭제되었습니다.");
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
