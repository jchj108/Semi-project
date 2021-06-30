package review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.dao.MemberDAO;
import review.model.vo.Review;
import review.model.vo.ReviewAttachment;

public class ReviewDAO {
	
	private Properties prop = new Properties();
	
	public ReviewDAO() {
		String fileName = MemberDAO.class.getResource("/sql/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getR_body());
			pstmt.setInt(2, r.getR_total());
			pstmt.setInt(3, r.getR_teacher());
			pstmt.setInt(4, r.getR_service());
			pstmt.setInt(5, r.getR_gym());
			pstmt.setString(6, r.getR_keyword());
			pstmt.setInt(7, r.getReviewerNo());
			pstmt.setInt(8, r.getGymNo());
			pstmt.setInt(9, r.getR_price());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertReviewAttachment(Connection conn, ArrayList<ReviewAttachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReviewAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				ReviewAttachment ra = fileList.get(i);
			
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, ra.getR_file_path());
				pstmt.setString(2, ra.getR_origin_name());
				pstmt.setString(3, ra.getR_change_name());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Review detailReview(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review r = null;
		
		String query = prop.getProperty("detailReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getInt("R_NO"), rset.getString("R_BODY"), rset.getDate("R_DATE"),
							   rset.getInt("R_TOTAL"), rset.getInt("R_TEACHER"), rset.getInt("R_SERVICE"),
							   rset.getInt("R_GYM"), rset.getInt("R_PRICE"), rset.getString("R_KEYWORD"),
							   rset.getString("R_STATUS"), rset.getInt("M_NO"), rset.getString("M_NAME"), rset.getInt("G_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}

	public ArrayList<ReviewAttachment> detailReviewAttachment(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewAttachment> list = null;
		
		String query = prop.getProperty("detailReviewAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReviewAttachment>();
			
			while(rset.next()) {
				list.add(new ReviewAttachment(rset.getInt("R_FILE_NO"), rset.getString("R_FILE_PATH"),
											  rset.getString("R_ORIGIN_NAME"), rset.getString("R_CHANGE_NAME"),
											  rset.getDate("R_UPLOAD_DATE"), rset.getString("R_STATUS"), rset.getInt("R_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReview");
		
		try {
			// R_BODY=?, R_TOTAL=?, R_TEACHER=?, R_SERVICE=?, R_GYM=?, R_KEYWORD=?, R_PRICE=? WHERE R_NO=? AND R_STATUS='N'
			// UPDATE REVIEW SET R_BODY=?, R_TOTAL=?, R_TEACHER=?, R_SERVICE=?, R_GYM=?, R_KEYWORD=?, R_DATE=?, R_PRICE=? WHERE R_NO=?
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getR_body());
			pstmt.setInt(2, r.getR_total());
			pstmt.setInt(3, r.getR_teacher());
			pstmt.setInt(4, r.getR_service());
			pstmt.setInt(5, r.getR_gym());
			pstmt.setString(6, r.getR_keyword());
			pstmt.setInt(7, r.getR_price());
			pstmt.setInt(8, r.getR_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteReviewAttachment(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReveiwAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, r.getR_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReviewAttachment(Connection conn, ArrayList<ReviewAttachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReviewAttachment");
		
		// INSERT INTO REVIEW_FILE VALUES(RFILE_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, DEFAULT, ?)
		try {
			for(int i = 0; i < fileList.size(); i++) {
				ReviewAttachment ra = fileList.get(i);
			
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, ra.getR_file_path());
				pstmt.setString(2, ra.getR_origin_name());
				pstmt.setString(3, ra.getR_change_name());
				pstmt.setInt(4, ra.getR_no());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

	


}
