package gym.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.model.service.GymService;
import gym.model.vo.GFile;
import gym.model.vo.Gym;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewAttachment;

/**
 * Servlet implementation class GymDetailServlet
 */
@WebServlet("/detail.do")
public class GymDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gNo = request.getParameter("gNo");
		
		GymService gService = new GymService();
		ReviewService rService = new ReviewService();
		
		Gym g = gService.selectGymInfo(gNo);
		ArrayList<GFile> fileList = gService.selectImage(gNo);
		ArrayList<Review> rList = rService.selectReview(gNo);
		ArrayList<ReviewAttachment> raList = rService.selectReviewAttachment(gNo);
		
		String page = null;
		if(g != null) {
			page = "WEB-INF/views/gym/gymDetail.jsp";
			request.setAttribute("g", g);
			request.setAttribute("fileList", fileList);
			request.setAttribute("rList", rList);
			request.setAttribute("raList", raList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "시설 조회에 실패하였습니다.");
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
