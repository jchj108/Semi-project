package board.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.Comments;
import board.model.vo.PageInfo;
import board.model.vo.QnaFile;
import page.model.vo.Page;

public class BoardService {

	public int fListCount() {
		Connection conn = getConnection();
		
		int count = new BoardDAO().fListCount(conn);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Board> selectFList(Page pi) {
		Connection conn = getConnection();
	
		ArrayList<Board> list = new BoardDAO().selectFList(conn, pi);
	
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

	public int qListCount() {
		Connection conn = getConnection();
		
		int count = new BoardDAO().qListCount(conn);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Board> selectQList(Page pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectQList(conn, pi);
	
		close(conn);
		
		return list;

	}

	public Board detailBoard(int qNo) {
		Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		Board b = null;
		
		int result = dao.updateCount(conn, qNo);
		if(result > 0) {
			
			b = dao.detailBoard(conn, qNo);
			
			if(b != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}		
		
		close(conn);
		return b;
	}

	public ArrayList<QnaFile> selectFile(int qNo) {
		Connection conn = getConnection();
		
		ArrayList<QnaFile> fileList = new BoardDAO().seletFile(conn, qNo);
		
		close(conn);
		
		return fileList;
	}

	public ArrayList<Comments> selectComment(int qNo) {
		Connection conn = getConnection();
		
		ArrayList<Comments> cList = new BoardDAO().selectComments(conn, qNo);
		
		close(conn);
		return cList;
	}

	public int deleteBoard(int qNo) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteBoard(conn, qNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Comments> insertComment(Comments c) {
		Connection conn = getConnection();
		BoardDAO bDAO = new BoardDAO();
		
		int result = bDAO.insertComment(conn, c);
		
		ArrayList<Comments> list = null;
		if(result > 0) {
			commit(conn);
			list = bDAO.selectComments(conn, c.getbNo());
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return list;
	}
	
}
