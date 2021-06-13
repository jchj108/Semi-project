package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Paging;

/**
 * Servlet implementation class FaqListServlet
 */
@WebServlet("/faqList.bo")
public class FaqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount = new BoardService().countFaq();	// 총 게시글
		int startPage;	// 페이징 중 첫 페이지
		int endPage;	// 페이징 중 끝 페이지
		int maxPage;	// 가장 마지막 페이지
		int pageLimit = 5;	// 표시될 페이징 수
		int boardLimit = 10;	// 표시될 게시글 수
		int currentPage;	// 현재 페이지
		
		
		Paging page = new Paging(listCount, startPage, endPage, maxPage, pageLimit, boardLimit, currentPage);
		
		
		ArrayList<Board> list = new BoardService().selectFaq();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
