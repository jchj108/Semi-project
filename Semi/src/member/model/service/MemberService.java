package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import member.model.dao.MemberDAO;
import member.model.vo.Member;


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

	public ArrayList<Board> selectMyBoard(int mNo) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new MemberDAO().selectMyBoard(conn, mNo);
		
		close(conn);
		
		return list;
	}

	public int countMyBoard(int mNo) {
		Connection conn = getConnection();
		
		int count = new MemberDAO().countMyBoard(conn, mNo);
		
		close(conn);
		
		return count;
	}


}
