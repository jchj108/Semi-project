package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

<<<<<<< HEAD
import board.model.dao.BoardDAO;
import board.model.vo.PageInfo;
=======
import board.model.vo.Board;
import board.model.vo.PageInfo;
import comments.model.vo.Comments;
>>>>>>> branch 'new' of https://github.com/AHNJUNGYUNG/Semi-project.git
import member.model.dao.MemberDAO;
import member.model.vo.Member;
import page.model.vo.Page;
import review.model.vo.Review;


public class MemberService {

	public Member loginMember(Member mem) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().loginMember(conn, mem);
		
		close(conn);
		return loginUser;
	}

	public int checkEmail(String inputEmail) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkEmail(conn, inputEmail);
		
		close(conn);
		return result;
	}

	public int insertMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().insertMember(conn, mem);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
		
	public int deleteMember(String email) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().deleteMember(conn, email);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int getUserCount() {
		Connection conn = getConnection();
		
		int userCount = new MemberDAO().getUserCount(conn);
		
		close(conn);
		
		return userCount;
	}
	
	public ArrayList<Member> selectUserList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDAO().selectUserList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectMyBoard(int mNo, Page pageInfo) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new MemberDAO().selectMyBoard(conn, mNo, pageInfo);
		
		close(conn);
		
		return list;
	}

	public int countMyBoard(int mNo) {
		Connection conn = getConnection();
		
		int count = new MemberDAO().countMyBoard(conn, mNo);
		
		close(conn);
		
		return count;
	}

	public int countMyReview(int mNo) {
		Connection conn = getConnection();
		
		int count = new MemberDAO().countMyReview(conn, mNo);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Review> selectMyReview(int mNo, Page pageInfo) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new MemberDAO().selectMyReview(conn, mNo, pageInfo);
		
		close(conn);
		
		return list;
	}

	public int countMyComment(int mNo) {
		Connection conn = getConnection();
		
		int count = new MemberDAO().countMyComment(conn, mNo);
		
		close(conn);
		
		return count;
		
	}

	public ArrayList<Comments> selectMyComment(int mNo, Page pageInfo) {
		Connection conn = getConnection();
		
		ArrayList<Comments> list = new MemberDAO().selectMyComment(conn, mNo, pageInfo);
		
		close(conn);
		
		return list;
	}

	public int updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updateMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member selectMember(int mNo) {
		Connection conn = getConnection();
		
		Member m = new MemberDAO().selectMember(conn, mNo);
		
		close(conn);
		
		return m;
	}
	
	public int getUserCount() {
		Connection conn = getConnection();
		
		int userCount = new MemberDAO().getUserCount(conn);
		
		close(conn);
		
		return userCount;
	}
	
	public ArrayList<Member> selectUserList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDAO().selectUserList(conn, pi);
		
		close(conn);
		
		return list;
	}
<<<<<<< HEAD
=======
	
	public int getUserCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int userCount = 0;
		
		String query = prop.getProperty("getUserCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				userCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return userCount;
	}
>>>>>>> new

	public ArrayList<Member> selectUserList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = prop.getProperty("selectUserList");
				
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member(rset.getInt("m_no"),
									  rset.getString("m_email"),
									  rset.getString("m_name"),
									  rset.getDate("m_date"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
