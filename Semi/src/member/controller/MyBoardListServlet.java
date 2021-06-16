package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import member.model.service.MemberService;
import member.model.vo.Member;
import page.model.vo.Page;

/**
 * Servlet implementation class MyBoardListServlet
 */
@WebServlet("/myBoardList.me")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)request.getSession().getAttribute("loginUser")).getM_no();
		MemberService mService = new MemberService();
		
		int listCount = mService.countMyBoard(mNo);	// 총 게시물 수
		
		int currentPage = 1;	// 현재 페이지
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int pageLimit = 5;	// 한 페이지 안에 페이징 되는 수
		int boardLimit = 10;	// 한 페이지 안에 들어갈 게시물 수
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	// 최대 페이지
		int startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;	// 페이징 내 시작 숫자
		int endPage = (startPage + pageLimit) - 1;	// 페이징 내 끝 숫자
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Page pageInfo = new Page(listCount, startPage, endPage, maxPage, pageLimit, boardLimit, currentPage);
			
		ArrayList<Board> list = mService.selectMyBoard(mNo);
		
		String page = null;
		
		if(list != null) {
			page = "WEB-INF/views/member/myBoardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시물 조회에 실패하였습니다.");
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
