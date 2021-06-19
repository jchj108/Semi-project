package gym.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gym.model.service.GymService;
import gym.model.vo.Gym;
import member.model.vo.Member;

@WebServlet("/home.do")
public class Mainservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Mainservlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		GymService service = new GymService();
		HttpSession session = request.getSession();
		
		ArrayList<Gym> covidList = service.selectCovidList();
		ArrayList<Gym> popularList = service.selectPopularList();
		
		String like = ((Member)session.getAttribute("loginUser")).getM_like();
		if(like != null) {
			ArrayList<Gym> recommendList = service.selectRecomendList(like);
		}
		
		String page = null;
		if(covidList != null && popularList != null) {
			page = "WEB-INF/views/common/mainPage.jsp";
			request.setAttribute("covidList", covidList);
			request.setAttribute("popularList", popularList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "시설 정보 조회에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
