package board.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.Comments;
import board.model.vo.PageInfo;
import board.model.vo.QnaFile;
import gym.model.vo.GFile;
import gym.model.vo.Gym;


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
	
	public int deleteBoard(String check) {
		Connection conn = getConnection();
		
		int result = 0;
		BoardDAO bDAO = new BoardDAO();
		
		String arr[] = check.split(",");
		String q_no = null;
		for(int i = 0; i < arr.length; i++) {
			q_no = arr[i];
			result = bDAO.deleteBoard(conn, q_no);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		
		close(conn);
		return result;
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
	

	public int getSearchGymListCount(String keyword, String category) {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getSearchGymListCount(conn, keyword, category);
		
		close(conn);
		
		return listCount;

	}

	
	public int getQListCount(int mNo) {
		Connection conn = getConnection();
		
		int count = new BoardDAO().getQListCount(conn, mNo);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Board> selectQList(PageInfo pi, int mNo) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectQList(conn, pi, mNo);
		
		close(conn);
		
		return list;
	}

	public int insertBoard(Board b, ArrayList<QnaFile> fileList) {
		Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.insertBoard(conn, b);
		
		if(result1 > 0) {
			int result2 = dao.insertBoardFile(conn, fileList);
			
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public int deleteOneboard(String qNo) {
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

	public int deleteMyComments(String string) {
			
				
		Connection conn = getConnection();
					
		String cNo = null;
		int result = 0;
			
		if(string != null) {
			for(int i = 0; i < string.split(", ").length; i++) {
				cNo = string.split(", ")[i];
								
				result += new BoardDAO().deleteMyComments(cNo, conn);
										
			}
				
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}		
			
			}
				
		close(conn);
				
		return result;
	}
	

	public int insertGym(Gym g, ArrayList<GFile> fileList) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.insertGym(conn, g);
		int result2 = dao.insertGFile(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1;
	}

	public int getSearchTitleList(String kw, String bDiv) {
		Connection conn = getConnection();
		
		int count = new BoardDAO().getSearchTitleList(kw, conn, bDiv);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Board> selectSearchTitleList(PageInfo pi, String kw, String bDiv) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectSearchTitleList(pi, kw, bDiv, conn);
		
		close(conn);
	
		return list;
	}

	public int getSearchWriterList(String kw, String bDiv) {
		Connection conn = getConnection();
		
		int count = new BoardDAO().getSearchWriterList(kw, conn, bDiv);
		
		close(conn);
		
		return count;
		
	}

	public ArrayList<Board> selectSearchWriterList(PageInfo pi, String kw, String bDiv) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectSearchWriterList(pi, kw, bDiv, conn);
		
		close(conn);
	
		return list;
	}

	public int updateBoard(Board b, ArrayList<QnaFile> fileList) {
		Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.updateBoard(conn, b);
		
		if(result1 > 0) {
			int result2 = dao.updateBoardFile(b, conn, fileList);
			
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}
}
