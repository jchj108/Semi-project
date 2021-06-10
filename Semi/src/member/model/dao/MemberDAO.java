package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

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
		if(mem.getM_profile() != "") {
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
			
			if(mem.getM_profile() != "") {
				pstmt.setString(8, mem.getM_like());
				pstmt.setString(7, mem.getM_profile());
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
}
