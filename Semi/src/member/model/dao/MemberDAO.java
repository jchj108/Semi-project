package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.Comments;
import board.model.vo.PageInfo;
import member.model.vo.Member;
import page.model.vo.Page;
import review.model.vo.Review;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, Member mem) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mem.getM_email());
			pstmt.setString(2, mem.getM_pwd());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginUser = new Member(rset.getInt("M_NO"),
									   rset.getString("M_EMAIL"),
									   rset.getString("M_PWD"),
									   rset.getString("M_NAME"),
									   rset.getString("M_GENDER").charAt(0),
									   rset.getString("M_ADDRESS"),
									   rset.getDate("M_DATE"),
									   rset.getString("M_ETC"),
									   rset.getInt("M_AUTH"),
									   rset.getString("M_STATUS"),
									   rset.getString("M_PROFILE"),
									   rset.getString("M_LIKE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int checkEmail(Connection conn, String inputEmail) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputEmail);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertMember(Connection conn, Member mem) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = null;
		if(mem.getM_profile() != null) {
			query = prop.getProperty("insertMember");
		} else {
			query = prop.getProperty("insertMember2");			
		}
		
		try {
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, mem.getM_email());
			pstmt.setString(2, mem.getM_pwd());
			pstmt.setString(3, mem.getM_name());
			pstmt.setString(4, mem.getM_gender()+"");
			pstmt.setString(5, mem.getM_address());
			pstmt.setString(6, mem.getM_etc());
			
			if(mem.getM_profile() != null) {
				pstmt.setString(7, mem.getM_profile());
				pstmt.setString(8, mem.getM_like());
			} else {
				pstmt.setString(7, mem.getM_like());
			} 
				result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
			
	public int deleteMember(Connection conn, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Board> selectMyBoard(Connection conn, int mNo, Page pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String query = prop.getProperty("selectMyBoard");
		int start = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
		int end = start + pageInfo.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
									
				b.setQ_no(rset.getInt("q_no"));
				b.setQ_title(rset.getString("q_title"));
				b.setQ_date(rset.getDate("q_date"));
				b.setwriterNo(rset.getInt("m_num"));
				
				list.add(b);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int countMyBoard(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("countMyBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public int countMyReview(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("countMyReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public ArrayList<Review> selectMyReview(Connection conn, int mNo, Page pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<Review>();
		
		String query = prop.getProperty("selectMyReview");
		
		int start = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
		int end = start + pageInfo.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review(rset.getInt("r_no"),
									rset.getString("r_body"),
									rset.getDate("r_date"));
				r.setGymNo(rset.getInt("g_no"));
												
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int countMyComment(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("countMyComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public ArrayList<Comments> selectMyComment(Connection conn, int mNo, Page pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comments> list = new ArrayList<Comments>();
		
		String query = prop.getProperty("selectMyComment");
		
		int start = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
		int end = start + pageInfo.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comments c = new Comments(rset.getInt("c_no"),
										rset.getString("c_body"),
										rset.getDate("c_date"),
										rset.getInt("q_no"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getM_pwd());
			pstmt.setString(2, m.getM_gender() + "");
			pstmt.setString(3, m.getM_address());
			pstmt.setString(4, m.getM_etc());
			pstmt.setString(5, m.getM_profile());
			pstmt.setString(6, m.getM_like());
			pstmt.setInt(7, m.getM_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectMember(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String querty = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(querty);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("m_no"),
								rset.getString("m_email"),
								rset.getString("m_pwd"),
								rset.getString("m_name"),
								rset.getString("m_gender").charAt(0),
								rset.getString("m_address"),
								rset.getDate("m_date"),
								rset.getString("m_etc"),
								rset.getInt("m_auth"),
								rset.getString("m_status"),
								rset.getString("m_profile"),
								rset.getString("m_like"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
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

	public int deleteUser(Connection conn, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	
}