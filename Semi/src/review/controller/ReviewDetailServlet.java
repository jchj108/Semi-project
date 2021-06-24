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
@WebServlet("/reviewDetail.re")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 시설 상세보기에서 리뷰를 누르면 location.href='<%= request.getContextPath() %>/reviewDetail.re?rNo=' + rNo;
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		ReviewService rs = new ReviewService();
		Review r = rs.detailReview(rNo);
		ArrayList<ReviewAttachment> list = rs.detailReviewAttachment(rNo);
				
		String page = null;
		if(r != null) {
			request.setAttribute("r", r);
			request.setAttribute("list", list);
			
			page="WEB-INF/views/review/reviewDetail.jsp";
		} else {
			request.setAttribute("msg", "작성된 리뷰가 없습니다");
			
			page="WEB-INF/common/errorPage.jsp";
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
