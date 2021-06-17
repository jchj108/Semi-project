package gym.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.model.service.GymService;
import gym.model.vo.Gym;

@WebServlet("/home.do")
public class Mainservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Mainservlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// setAttribute를 여러 개
		
		ArrayList<Gym> covidList = new GymService().selectCovidList();
		ArrayList<Gym> popularList = new GymService().selectPopularList();
		
		String page = null;
		if(covidList != null) {
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
