package imgboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class ImgBoardDao {
	private DBConnect dbconn;

	public ImgBoardDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(ImgBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into imgboard values(seq_imgboard.nextval, ?, sysdate, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPath());

			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 추가되었다");
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

	public ImgBoardVo select(int num) {
		Connection conn = dbconn.conn();

		String sql = "select * from imgboard where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return new ImgBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), 
						rs.getString(5), rs.getString(6));
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
		return null;
	}

	public ArrayList<ImgBoardVo> selectAll() {
		Connection conn = dbconn.conn();
		ArrayList<ImgBoardVo> list = new ArrayList<ImgBoardVo>();
		String sql = "select * from imgboard order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ImgBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), 
						rs.getString(5), rs.getString(6)));
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

	public void update(ImgBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "update imgboard set title=?, content=? where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());
			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 수정되었다");
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

	public void delete(int num) {
		Connection conn = dbconn.conn();

		String sql = "delete imgboard where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, num);
			int x = pstmt.executeUpdate();
			System.out.println(x + " 줄이 삭제되었다");
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
