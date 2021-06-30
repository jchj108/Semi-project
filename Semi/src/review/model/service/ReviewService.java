package review.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
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
		int result2 = new ReviewDAO().insertReviewAttachment(conn, fileList);
		
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
		int result2 = new ReviewDAO().deleteReviewAttachment(conn, r);
		int result3 = 0;
		
		System.out.println(result1 + " : 리뷰 업데이트 결과");
		
		if(result2 > 0) {
			result3 = new ReviewDAO().updateReviewAttachment(conn, fileList);
		}
		
		System.out.println(result2 + " : 리뷰 파일 삭제 결과");
		System.out.println(result3 + " : 리뷰 파일 업데이트 결과");
		
		if(result1 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
				
		return result1;
	}

}
