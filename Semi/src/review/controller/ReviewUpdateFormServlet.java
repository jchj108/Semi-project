package review.controller;

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
 * Servlet implementation class ReviewUpdateFormServlet
 */
@WebServlet("/reviewUpdateForm.re")
public class ReviewUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		String gNo = request.getParameter("gNo");
		
		GymService gService = new GymService();
		Gym g = gService.selectGymInfo(gNo);
		ArrayList<GFile> gfList = gService.selectImage(gNo);
		
		ReviewService rs = new ReviewService();
		Review r = rs.detailReview(rNo);
		ArrayList<ReviewAttachment> raList = rs.detailReviewAttachment(rNo);
		
		String page = null;
		if(r != null && raList.size() != 0) {
			request.setAttribute("r", r);
			request.setAttribute("raList", raList);
			request.setAttribute("g", g);
			request.setAttribute("gfList", gfList);
			page="WEB-INF/views/review/reviewUpdate.jsp";
		} else if(r != null && raList.size() == 0){
			request.setAttribute("r", r);
			request.setAttribute("g", g);
			request.setAttribute("gfList", gfList);
			page="WEB-INF/views/review/reviewUpdate.jsp";
		} else {
			page="WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "????????? ????????? ????????????");			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
//		System.out.println(rNo + " : ????????????");
//		System.out.println(gNo + " : ????????????");
//		System.out.println(r.getR_total() + " : ??????");
//		System.out.println(r.getR_gym() + " : ??????");
//		System.out.println(r.getR_price() + " : ??????");
//		System.out.println(r.getR_service() + " : ?????????");
//		System.out.println(r.getR_teacher() + " : ??????");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
