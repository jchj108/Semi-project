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
import member.model.vo.Member;

/**
 * Servlet implementation class FAQListServlet
 */
@WebServlet("/qna.do")
public class QNAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String searchList = request.getParameter("searchList");
		String kw = request.getParameter("searchKeyword");
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int mNo = m.getM_no();
		String bDiv = "Q";
		
		BoardService bService = new BoardService();
		PageInfo pi = null;
		ArrayList<Board> qList = null;
		
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
		
		if(m.getM_auth() == 0) {
			if(kw == null && searchList == null) {
				listCount = bService.getListCount(bDiv);
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
				endPage = (startPage + pageLimit) - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				qList = bService.selectBoardList(pi, bDiv);
			} else {
				listCount = bService.getSearchQnaCount1(searchList, kw);
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
				endPage = (startPage + pageLimit) - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				qList = bService.selectSearchQna1(pi, searchList, kw);
			}
		} else {
			if(kw == null && searchList == null) {
				listCount = bService.getQListCount(mNo);
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
				endPage = (startPage + pageLimit) - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				qList = bService.selectQList(pi, mNo);
			} else {
				listCount = bService.getSearchQnaCount2(searchList, kw, mNo);
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
				endPage = (startPage + pageLimit) - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				qList = bService.selectSearchQna2(pi, searchList, kw, mNo);
			}
		}
		
		String page = null;
		
		if(qList != null) {
			page = "WEB-INF/views/board/qnaList.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("qList", qList);
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
