package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import gym.model.vo.Gym;
import page.model.vo.Page;


public class BoardService {

	public int getListCount(String str) {
		Connection conn = getConnection();
		
		BoardDAO bDAO = new BoardDAO();
		
		int listCount = bDAO.getListCount(conn, str);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectBoardList(PageInfo pi, String str) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectBoardList(conn, pi, str);
		
		close(conn);
		
		return list;
	}

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

	public int getGymListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getGymListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Gym> selectGymList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new BoardDAO().selectGymList(conn, pi);
		
		close(conn);
		
		return list;
		
	}

	public ArrayList<Gym> searchGym(String keyword, String category, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new BoardDAO().searchGym(conn, keyword, category, pi);
		
		close(conn);
		
		return list;
	}

	public int getSearchGymListCount(String keyword, String category) {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getSearchGymListCount(conn, keyword, category);
		
		close(conn);
		
		return listCount;
	}

}
