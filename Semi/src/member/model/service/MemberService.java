package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.Comments;
import board.model.vo.PageInfo;
import gym.model.vo.Gym;
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

	public int deleteUser(String check) {
		Connection conn = getConnection();
		
		int result = 0;
		MemberDAO mDAO = new MemberDAO();
		
		String arr[] = check.split(",");
		String email = null;
		for(int i = 0; i < arr.length; i++) {
			email = arr[i];
			result = mDAO.deleteUser(conn, email);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
				break;
			}
		}
		
		close(conn);
		
		return result;
	}

	public int countMyFav(int mNo) {
		Connection conn = getConnection();
		
		int count = new MemberDAO().countMyFav(conn, mNo);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Gym> selectMyFav(int mNo, Page pi) {
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new MemberDAO().selectMyFav(conn, pi, mNo);
		
		return list;
	}

	public int updatePwd(String changePwd, String email) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updatePwd(conn, changePwd, email);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
}
