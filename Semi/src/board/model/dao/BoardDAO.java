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
import board.model.vo.Comments;
import board.model.vo.PageInfo;
import board.model.vo.QnaFile;
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

	public int fListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("fListCount");	
		
		try {
					
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt(1);	
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return count;
	}

	public ArrayList<Board> selectFList(Connection conn, Page pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		String query = prop.getProperty("selectFList");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
	
	public int getListCount(Connection conn, String q) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> selectBoardList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String query = prop.getProperty("selectBoardList");
		
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

	public int qListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("qListCount");	
		
		try {
					
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt(1);	
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return count;
	}

	public ArrayList<Board> selectQList(Connection conn, Page pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		String query = prop.getProperty("selectQList");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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

	public int updateCount(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, qNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Board detailBoard(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("detailBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("q_no"),
							rset.getString("q_title"),
							rset.getString("q_body"),
							rset.getDate("q_date"),
							rset.getInt("q_count"),
							rset.getString("q_secret"),
							rset.getString("q_status"),
							rset.getString("q_board_div"),
							rset.getInt("m_num"),
							rset.getString("m_name"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public ArrayList<QnaFile> seletFile(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QnaFile> fileList = new ArrayList<QnaFile>();
		
		String query = prop.getProperty("selectFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				QnaFile qFile = new QnaFile(rset.getInt("q_file_no"),
											rset.getString("q_file"),
											rset.getString("q_status"),
											rset.getInt("q_no"));
				
				fileList.add(qFile);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fileList;
	}

	public ArrayList<Comments> selectComments(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comments> cList = new ArrayList<Comments>();
		
		String query = prop.getProperty("selectComments");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comments co = new Comments(rset.getInt("c_no"),
										rset.getString("c_body"),
										rset.getDate("c_date"),
										rset.getString("c_status"),
										rset.getInt("q_no"),
										rset.getInt("m_no"),
										rset.getString("m_name"));
				cList.add(co);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}

//	public int deleteBoard(Connection conn, int qNo) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = prop.getProperty("deleteBoard");
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, qNo);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}

	public int insertComment(Connection conn, Comments c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getC_body());
			pstmt.setInt(2, c.getbNo());
			pstmt.setInt(3, c.getcWriterNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
