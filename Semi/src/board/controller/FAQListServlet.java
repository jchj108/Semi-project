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
		
		String searchList = request.getParameter("searchList");
		String kw = request.getParameter("searchKeyword");
		
		int listCount;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		};
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		String str = "F";		
		BoardService bService = new BoardService();
		PageInfo pi = null;
		ArrayList<Board> list = null;
		
		if(kw == null && searchList == null) {
			listCount = bService.getListCount(str); 
									
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			
			startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage; 
			}
			
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			list = bService.selectBoardList(pi, str);
		} else {
			listCount = bService.searchFaqCount(searchList, kw);
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			
			startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage; 
			}
			
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			list = bService.selectSearchFaq(pi, searchList, kw);
		}
				
		String page = null;
		
		if(list != null) {
			page = "WEB-INF/views/board/faqList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
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
