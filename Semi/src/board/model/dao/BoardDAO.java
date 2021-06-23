package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
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
import board.model.vo.PageInfo;
import page.model.vo.Page;

public class BoardDAO {
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String filename = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	public int bListCount(Connection conn, String bDiv) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("bListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bDiv);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public ArrayList<Board> selectList(Connection conn, Page pi, String bDiv) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, bDiv);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board(rset.getInt("q_no"),
									rset.getString("q_title"),
									rset.getDate("q_date"),
									rset.getInt("m_num"),
									rset.getString("m_name"));
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
	
	public int getListCount(Connection conn, String str) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = null;
		if(str.equals("Q")) {
			query = prop.getProperty("getQListCount");
		} else {
			query = prop.getProperty("getFListCount");
		}
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> selectBoardList(Connection conn, PageInfo pi, String str) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String query = null;
		if(str.equals("Q")) {
			query = prop.getProperty("selectBoardQList");
		} else {
			query = prop.getProperty("selectBoardFList");
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board(rset.getInt("q_no"),
									rset.getString("q_title"),
									rset.getDate("q_date"),
									rset.getString("m_email"));
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

	public int deleteBoard(Connection conn, String q_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(q_no));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}