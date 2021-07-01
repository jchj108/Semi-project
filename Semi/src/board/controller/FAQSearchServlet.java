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
 * Servlet implementation class FAQSearchServlet
 */
@WebServlet("/searchFaq.do")
public class FAQSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bDiv = "F";
		String searchList = request.getParameter("searchList");
		String kw = request.getParameter("searchKeyword");
		
		BoardService service = new BoardService();
		PageInfo pi = null;
		ArrayList<Board> list = null;
		
		int listCount;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int boardLimit = 10;
		int pageLimit = 5;
		
		int maxPage;		
		int startPage; 
		int endPage;
		
		if(searchList.equals("제목")) {
			listCount = service.getSearchTitleList(kw, bDiv);
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
			endPage = (startPage + pageLimit) - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			list = service.selectSearchTitleList(pi, kw, bDiv);
		} else {
				listCount = service.getSearchWriterList(kw, bDiv);
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
				endPage = (startPage + pageLimit) - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				list = service.selectSearchWriterList(pi, kw, bDiv);
		}
		
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/board/faqList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 검색에 실패하였습니다.");
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
