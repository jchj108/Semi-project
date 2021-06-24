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
import board.model.vo.PageInfo;
import page.model.vo.Page;

/**
 * Servlet implementation class FAQListServlet
 */
@WebServlet("/faq.do")
public class FAQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardService();
		
		String bDiv = "F";
		
		int listCount = bService.getListCount(bDiv);
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int boardLimit = 10;
		int pageLimit = 5;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		int endPage = (startPage + pageLimit) - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Page pi = new Page(listCount, startPage, endPage, maxPage, pageLimit, boardLimit, currentPage);
		
		ArrayList<Board> fList = bService.selectFaqList(pi);
		
		String page = null;
		
		if(fList != null) {
			page = "WEB-INF/views/board/faqList.jsp";
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg","게시판 조회에 실패하였습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
