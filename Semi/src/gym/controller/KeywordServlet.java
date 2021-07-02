package gym.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class KeywordServlet
 */
@WebServlet("/keyword.do")
public class KeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gNo = request.getParameter("gNo");
		
		ArrayList<Review> rList = new ReviewService().selectReview(gNo);
		
		String[] keyword = null;
		JSONArray jArr = new JSONArray();
		int count0 = 0;
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int etc = 0;
		
		for(int i = 0; i < rList.size(); i++) {
			keyword = rList.get(i).getR_keyword().split(", ");
			
			for(int j = 0; j < keyword.length; j++) {
				if(keyword[j].equals("체지방 감소")) {
					count0++;
				} else if(keyword[j].equals("근력 증가")) {
					count1++;
				} else if(keyword[j].equals("재활")) {
					count2++;
				} else if(keyword[j].equals("체형교정")) {
					count3++;
				} else {
					etc++;
				}
			}
		}
			jArr.add(count0);
			jArr.add(count1);
			jArr.add(count2);
			jArr.add(count3);
			jArr.add(etc);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().println(jArr);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
