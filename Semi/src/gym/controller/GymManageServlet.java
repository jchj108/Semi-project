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

@WebServlet("/gymManage.do")
public class GymManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GymManageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;

		ArrayList<Gym> gymList = new ArrayList();
		String keyword = request.getParameter("searchKeyword");
		String category = request.getParameter("searchList");
		GymService gService = new GymService();
		listCount = gService.getGymListCount();
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		if (keyword != null && category != null && keyword != "") {

			request.setAttribute("category", category);
			request.setAttribute("keyword", keyword);

			listCount = gService.getSearchGymListCount(keyword, category);

			maxPage = (int) Math.ceil((double) listCount / boardLimit);
			startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			if (endPage > maxPage) {
				endPage = maxPage;
			}
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			gymList = gService.searchGym(keyword, category, pi);
		} else {
			gymList = gService.selectGymList(pi);
		}
		String page = null;
		if (gymList != null) {
			page = "WEB-INF/views/gym/gymManageList.jsp";
			request.setAttribute("gymList", gymList);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "시설 목록 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
