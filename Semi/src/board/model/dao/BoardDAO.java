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
import gym.model.vo.GFile;
import gym.model.vo.Gym;
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
			
			if(rset.next()) {
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
									rset.getString("q_body"),
									rset.getDate("q_date"),
									rset.getInt("q_count"),
									rset.getString("q_secret"),
									rset.getString("q_status"),
									rset.getString("q_board_div"),
									rset.getInt("m_num"),
									rset.getString("m_name"),
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
											rset.getInt("q_no"),
											rset.getString("q_origin_name"),
											rset.getString("q_change_name"));
				
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
		

	public int getGymListCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("gymListCount");
		
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

	public ArrayList<Gym> selectGymList(Connection conn, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectGymList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"),
						rset.getString("g_TYPE_NM"),
						rset.getString("g_GU_NM"),
						rset.getString("g_NAME"),
						rset.getString("g_ADDRESS"),
						rset.getDouble("g_YCODE"),
						rset.getDouble("g_XCODE"),
						rset.getString("g_TEL"),
						rset.getString("g_EDU_YN"),
						rset.getString("g_IN_OUT"),
						rset.getString("G_STATUS").charAt(0),
						rset.getInt("g_COUNT"),
						rset.getInt("g_COVID"),
						rset.getString("g_CHANGE_NAME"));
				System.out.println(g);
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
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

	public ArrayList<Gym> searchGym(Connection conn, String keyword, String category, PageInfo pi) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		String query = null;

		switch(category) {
		
		case "시설번호" :
			query = prop.getProperty("searchByNo"); break;
		case "이름" :
			query = prop.getProperty("searchByName"); break;
		case "타입" :
			query = prop.getProperty("searchByType"); break;
		case "군/구" :
			query = prop.getProperty("searchByGu"); break;
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"),
						rset.getString("g_TYPE_NM"),
						rset.getString("g_GU_NM"),
						rset.getString("g_NAME"),
						rset.getString("g_ADDRESS"),
						rset.getDouble("g_YCODE"),
						rset.getDouble("g_XCODE"),
						rset.getString("g_TEL"),
						rset.getString("g_EDU_YN"),
						rset.getString("g_IN_OUT"),
						rset.getString("G_STATUS").charAt(0),
						rset.getInt("g_COUNT"),
						rset.getInt("g_COVID"),
						rset.getString("g_CHANGE_NAME"));
				System.out.println(g);
				list.add(g);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}	
	

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

		

	public int getSearchGymListCount(Connection conn, String keyword, String category) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = null;
		
		switch(category) {

	
		case "이름" : 
			query = prop.getProperty("getSearchGymListCountByName"); 
			break;
		case "시설번호" :
			query = prop.getProperty("getSearchGymListCountByNo"); 
			break;
		case "군/구" :
			query = prop.getProperty("getSearchGymListCountByGu"); 
			break;
		case "타입" :
			query = prop.getProperty("getSearchGymListCountByType"); 
			break;
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
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
		System.out.println("dao listCount : " + listCount);
		
		return listCount;
	}

	public int getQListCount(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("getQcount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
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


	public ArrayList<Board> selectQList(Connection conn, PageInfo pi, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		
		String query = prop.getProperty("selectQList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getQ_title());
			pstmt.setString(2, b.getQ_body());
			pstmt.setString(3, b.getQ_secret());
			pstmt.setString(4, b.getQ_board_div());
			pstmt.setInt(5, b.getWriterNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int insertBoardFile(Connection conn, ArrayList<QnaFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoardFile");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				QnaFile qf = fileList.get(i); 
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, qf.getQ_file());				
				pstmt.setString(2, qf.getOriginName());
				pstmt.setString(3, qf.getChangeName());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int insertGym(Connection conn, Gym g) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGym");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getG_TYPE_NM());
			pstmt.setString(2, g.getG_GU_NM());
			pstmt.setString(3, g.getG_NAME());
			pstmt.setString(4, g.getG_ADDRESS());
			pstmt.setString(5, g.getG_TEL());
			pstmt.setString(6, g.getG_BIGO());
			pstmt.setString(7, g.getG_HOMEPAGE());
			pstmt.setString(8, g.getG_EDU_YN());
			pstmt.setString(9, g.getG_IN_OUT());
			pstmt.setString(10, g.getG_PARIKING_LOT());
			pstmt.setInt(11, g.getG_COVID());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertGFile(Connection conn, ArrayList<GFile> fileList) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGFile");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				GFile f = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, f.getgOriginName());
				pstmt.setString(2, f.getgChangeName());
				pstmt.setString(3, f.getgFilePath());
				pstmt.setInt(4, f.getgFileLv());
				
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
