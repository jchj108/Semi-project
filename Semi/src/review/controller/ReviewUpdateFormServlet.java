package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		ReviewService rs = new ReviewService();
		Review r = rs.detailReview(rNo);
		ArrayList<ReviewAttachment> list = rs.detailReviewAttachment(rNo);
				
		String page = null;
		if(r != null) {
			page="WEB-INF/views/review/reviewUpdate.jsp";
			request.setAttribute("r", r);
			request.setAttribute("list", list);
			
		} else {
			page="WEB-INF/common/errorPage.jsp";
			request.setAttribute("msg", "작성된 리뷰가 없습니다");			
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
