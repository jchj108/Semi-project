package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;


public class MemberService {

	public Member loginMember(Member mem) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().loginMember(conn, mem);
		
		close(conn);
		return loginUser;
	}


}
