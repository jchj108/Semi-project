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

/**
 * Servlet implementation class RecommendServlet
 */
@WebServlet("/recommend.me")
public class RecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String locationStr = request.getParameter("location");
		String inout = request.getParameter("inout");
		String gymType = request.getParameter("gymType");
		String lecture = request.getParameter("lecture");
		String parking = request.getParameter("parking");
		
		System.out.println(locationStr + " : 위치");
		System.out.println(inout + " : 실내실외");
		System.out.println(gymType + " : 단체개인");
		System.out.println(lecture + " : 강습");
		System.out.println(parking + " : 주차");
		
		Gym rGym = new Gym(gymType, locationStr, lecture, parking, inout);
		// g_type_nm=gymType, g_gu_nm=locationStr, g_tel=parking, g_edu_yn=lecture, g_in_out=inout
		
		ArrayList<Gym> list = new GymService().recommendGym(rGym);
		
		// -이면 주차불가
		// 주차 불가
		// 주차 가능
		// like %불가 and -
		// 관계없음이면 where에 조건 안넣으면 됨
		// gymType = "단체" => 축구, 족구, 테니스, 배트민턴, 농구 %
		// 개인 => 골프, 수영
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
