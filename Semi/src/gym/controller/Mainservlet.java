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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		GymService service = new GymService();

		String[] gu = new String[] { "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구",
				"서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구" };
		String like = "";

		ArrayList<Gym> covidList = service.selectCovidList();
		ArrayList<Gym> popularList = service.selectPopularList();
		ArrayList<Gym> localList = null; // 구를 포함하면 지역 시설 리스트 받아옴.
		ArrayList<Gym> recommendList = null;

		if (session.getAttribute("loginUser") != null
				&& ((Member) (session.getAttribute("loginUser"))).getM_address() != null) {
			String userAddr = ((Member) (session.getAttribute("loginUser"))).getM_address();
			for (String s : gu) {
				if (userAddr.contains(s)) {
					String[] arr = userAddr.split(" ");
					String gu_nm = arr[1];
					localList = service.selectLocalList(gu_nm);	break;
				} else {
					localList = service.selectRandomGymList();
				}
			}
		} else {
			localList = service.selectRandomGymList();
		}
		
		if (session.getAttribute("loginUser") != null
				&& !(((Member) session.getAttribute("loginUser")).getM_like().equals("없음"))) {
			Member user = (Member) (session.getAttribute("loginUser"));
			switch (user.getM_like()) {
			case "수영":
				like = "수영장";
				break;
			case "축구":
				like = "축구장";
				break;
			case "테니스":
				like = "테니스장";
				break;
			case "골프":
				like = "골프연습장";
				break;
			case "족구":
				like = "족구연습장";
				break;
			case "배드민턴":
				like = "배드민턴장";
				break;
			case "농구":
				like = "농구장";
				break;
			case "풋살":
				like = "풋살장";
				break;
			default:
				recommendList = service.selectRandomGymList();
			}
			recommendList = service.selectRecomendList(like);
		} else {
			recommendList = service.selectRandomGymList(); // 랜덤 리스트
		}

		String page = null;
		if (covidList != null && popularList != null && recommendList != null && localList != null) {
			page = "WEB-INF/views/common/mainPage.jsp";
			request.setAttribute("covidList", covidList);
			request.setAttribute("popularList", popularList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("localList", localList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "시설 정보 조회에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
