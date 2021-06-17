package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.model.vo.Comments;
import member.model.service.MemberService;
import member.model.vo.Member;
import page.model.vo.Page;

/**
 * Servlet implementation class MyCommentListServlet
 */
@WebServlet("/myCommentList.me")
public class MyCommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)request.getSession().getAttribute("loginUser")).getM_no();
		MemberService mService = new MemberService();
		
		int listCount = mService.countMyComment(mNo);
		
		int currentPage = 1;	
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int pageLimit = 5;	
		int boardLimit = 10;	
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	
		int startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;	
		int endPage = (startPage + pageLimit) - 1;	
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Page pageInfo = new Page(listCount, startPage, endPage, maxPage, pageLimit, boardLimit, currentPage);
			
		ArrayList<Comments> list = mService.selectMyComment(mNo, pageInfo);
		
		String page = null;
		
		if(list != null) {
			page = "WEB-INF/views/member/myCommentList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 조회에 실패하였습니다.");
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
