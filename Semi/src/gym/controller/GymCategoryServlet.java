package gym.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.PageInfo;
import gym.model.service.GymService;
import gym.model.vo.Gym;


/**
 * Servlet implementation class GymCategoryServlet
 */
@WebServlet("/gymCategory.do")
public class GymCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		GymService service = new GymService();
		
		String ca = request.getParameter("category");
		
		
		int listCount;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int boardLimit = 6;
		int pageLimit = 5;
		
		int maxPage;		
		int startPage;
		int endPage;

		PageInfo pi = null;	
		ArrayList<Gym> gList = null;
		
		if(ca.equals("all")) {
			listCount = service.gEListCount();
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
			endPage = (startPage + pageLimit) - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			gList = service.selectGEList(pi);
			
		} else {
			String category = null;
			
			switch(ca) {
			case "swimming": category="수영장"; break;
			case "soccer": category="축구장"; break;
			case "tennis": category="테니스장"; break;
			case "golf": category="골프연습장"; break;
			case "footVolley": category="족구장"; break;
			case "badminton": category="배드민턴장"; break;
			case "basketball": category="농구장"; break;
			}
			
			listCount = service.gListCount(category);
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
			endPage = (startPage + pageLimit) - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			gList = service.selectGList(category, pi);
		}
		
		String page = null;
		
		if(gList != null) {
			page = "WEB-INF/views/gym/gymCategory.jsp";
			request.setAttribute("gList", gList);
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
