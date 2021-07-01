package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.dao.ReviewDAO;
import review.model.vo.Review;
import review.model.vo.ReviewAttachment;


public class ReviewService {

	public int insertReview(ArrayList<ReviewAttachment> fileList, Review r) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDAO().insertReview(conn, r);
		
		int result2 = 0;
		if(fileList.size() > 0) {
			result2 = new ReviewDAO().insertReviewAttachment(conn, fileList);			
		} else {
			// 첨부파일이 없을 때
			result2 = 1;
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
				
		return result1;
	}

	public Review detailReview(int rNo) {
		Connection conn = getConnection();
		
		Review r = new ReviewDAO().detailReview(conn, rNo);
		
		close(conn);
		
		return r;
	}

	public ArrayList<ReviewAttachment> detailReviewAttachment(int rNo) {
		Connection conn = getConnection();
		
		ArrayList<ReviewAttachment> list = new ReviewDAO().detailReviewAttachment(conn, rNo);
		
		close(conn);
		
		return list;
	}

	public int updateReview(ArrayList<ReviewAttachment> fileList, Review r) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDAO().updateReview(conn, r);
		
		// 원래 있던 첨부파일 삭제
		int result2 = new ReviewDAO().deleteReviewAttachment(conn, r);
		
		int result3 = 0;
		if(result2 > 0 && fileList.size() > 0) {
			result3 = new ReviewDAO().updateReviewAttachment(conn, fileList);
		} else if(fileList.size() == 0) {
			result3 = 1;
		}
		
		if(result1 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
				
		return result1;
	}

	public ArrayList<Review> selectReview(String gNo) {
		Connection conn = getConnection();

		ArrayList<Review> list = new ReviewDAO().selectReview(conn, gNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<ReviewAttachment> selectReviewAttachment(String gNo) {
		Connection conn = getConnection();
		
		ArrayList<ReviewAttachment> list = new ReviewDAO().selectReviewAttachment(conn, gNo);
		
		close(conn);
		
		return list;
	}

	public int updateLikeCount(int rNo) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().updateLikeCount(conn, rNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteReview(int rNo) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().deleteReview(conn, rNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
