package gym.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gym.model.service.GymService;
import member.model.vo.Member;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/favorite.do")
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int mNo = loginUser.getM_no();
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		
		GymService gService = new GymService();
		
		int result = gService.selectFavorite(gNo, mNo);
		String data = null;
		
		if(result > 0) {
			result = gService.deleteFavorite(gNo, mNo);
			
			if(result > 0) {
				data = "즐겨찾기";
				response.getWriter().println(data);
			} else {
				request.setAttribute("msg", "즐겨찾기 해제에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			result = gService.insertFavorite(gNo, mNo);

			if(result > 0) {
				data = "즐겨찾기 해제";
				response.getWriter().println(data);
			} else {
				request.setAttribute("msg", "즐겨찾기 추가에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
