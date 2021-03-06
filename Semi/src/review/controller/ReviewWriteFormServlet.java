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

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/reviewWriteForm.re")
public class ReviewWriteFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gNo = request.getParameter("gNo");
		
		GymService gService = new GymService();
		Gym g = gService.selectGymInfo(gNo);
		ArrayList<GFile> fList = gService.selectImage(gNo);
		
		request.setAttribute("g", g);
		request.setAttribute("fList", fList);
		request.getRequestDispatcher("WEB-INF/views/review/reviewWrite.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
