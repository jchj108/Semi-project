package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.PageInfo;
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


}
