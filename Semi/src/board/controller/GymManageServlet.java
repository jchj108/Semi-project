package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.PageInfo;
import gym.model.vo.Gym;

@WebServlet("/gymManage.do")
public class GymManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GymManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		ArrayList<Gym> gymList = null;
		String likeKeyword;
		
		String keyword = request.getParameter("searchKeyword");
		String category = request.getParameter("searchList");
		System.out.println("keyword = " + keyword);
		System.out.println("category = " + category);
		
		BoardService bService = new BoardService();
		listCount = bService.getGymListCount();
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage - 1)/pageLimit) * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		
		if(keyword != null && category != null) {
			
			switch(category) {
				
				case "이름" : 
					System.out.println("이름에 들어옴");
					category = "G_NAME"; 
					likeKeyword = "%" + keyword + "%";
					gymList = bService.searchGymList(category, likeKeyword, pi);
					
					for(Gym g : gymList) {
						System.out.println(g);
					}
					
					break;
				case "타입" :
					category = "G_TYPE_NM"; break;
				case "군/구" :
					category = "G_GU_NM"; break;
			}
		} else {
			gymList = bService.selectGymList(pi);
		}
		
		
		
		String page = null;
		
		if(gymList != null) {
			page = "WEB-INF/views/board/gymManageList.jsp";
			request.setAttribute("gymList", gymList);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg","게시판 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
