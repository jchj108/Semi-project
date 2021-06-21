package board.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import page.model.vo.Page;

public class BoardService {

	public int bListCount(String bDiv) {
		Connection conn = getConnection();
		
		int count = new BoardDAO().bListCount(conn, bDiv);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Board> selectList(Page pi, String bDiv) {
		Connection conn = getConnection();
	
		ArrayList<Board> list = new BoardDAO().selectList(conn, pi, bDiv);
	
		close(conn);
		
		return list;
	}
	
	public int getListCount(String q) {
		Connection conn = getConnection();
		
		BoardDAO bDAO = new BoardDAO();
		
		int listCount = bDAO.getListCount(conn, q);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectBoardList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectBoardList(conn, pi);
		
		close(conn);
		
		return list;
	}


}
