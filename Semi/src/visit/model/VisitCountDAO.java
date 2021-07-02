package visit.model;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VisitCountDAO {
	private static VisitCountDAO instance;
	
	// 싱글톤 패턴
	private VisitCountDAO() {}
	public static VisitCountDAO getInstance() {
		if(instance == null) {
			instance = new VisitCountDAO();
		}
		
		return instance;
	}
	
	// 총 방문자 수 증가
	public void setTotalCount() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 쿼리 생성
			// 총 방문자 수를 증가시키기 위해 테이블에 현재 날짜 값을 추가 시킨다
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO VISIT (V_DATE) VALUES (SYSDATE)");
			
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.executeUpdate();
			
			commit(conn);
			
		} catch (SQLException e) {
			rollback(conn);
			throw new RuntimeException(e.getMessage());
		} finally {
			if(pstmt != null) close(pstmt);
			if(conn != null) close(conn);
		}
	}
	
	// 총 방문자 수 가져오기
	public int getTotalCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		
		try {
			// 테이블의 데이터 수 가져오기
			// 데이터 수 = 총 방문자 수
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TotalCnt FROM VISIT");
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rset = pstmt.executeQuery();
			
			// 방문자 수 담기
			if(rset.next()) {
				totalCount = rset.getInt("TotalCnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) close(pstmt);
			if(conn != null) close(conn);
		}
		
		return totalCount;
	}
	
	// 오늘 방문자 수 가져오기
	public int getTodayCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int todayCount = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TodayCnt FROM VISIT");
			sql.append(" WHERE TO_DATE(V_DATE, 'YYYY-MM-DD') = TO_DATE(sysdate, 'YYYY-MM-DD')");
			conn = getConnection();
	
			pstmt = conn.prepareStatement(sql.toString());
			rset = pstmt.executeQuery();
			
			// 방문자 수를 변수에 담기
			if(rset.next()) {
				todayCount = rset.getInt("TodayCnt");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) close(pstmt);
			if(conn != null) close(conn);
		}
         
		return todayCount;
	}
	
}
