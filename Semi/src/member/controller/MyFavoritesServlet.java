package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.PageInfo;
import gym.model.vo.Gym;
import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class MyFavoritesServlet
 */
@WebServlet("/myFavoritesList.me")
public class MyFavoritesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFavoritesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)request.getSession().getAttribute("loginUser")).getM_no();
		MemberService mService = new MemberService();
		
		int listCount = mService.countMyFav(mNo);
		
		int currentPage = 1;	
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int pageLimit = 5;	
		int boardLimit = 6;	
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	
		int startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;	
		int endPage = (startPage + pageLimit) - 1;	
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Gym> list = mService.selectMyFav(mNo, pi);
		
		String page = null;
		
		if(list != null) {
			page = "WEB-INF/views/member/myFavoritesList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "즐겨찾기 조회에 실패하였습니다.");
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
