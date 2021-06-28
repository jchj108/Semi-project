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

/**
 * Servlet implementation class GymUpdateAjax
 */
@WebServlet("/gymUpdate.do")
public class GymUpdateAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymUpdateAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		
		GymService service = new GymService();
		
		ArrayList<Gym> gList = service.selectGym(gNo);		
		ArrayList<GFile> gFList = service.selectGFile(gNo);
		
		for(Gym g : gList) {
			System.out.println(g);
		}
		
		for(GFile gF : gFList) {
			System.out.println(gF);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
