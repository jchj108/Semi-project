package gym.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import gym.model.service.GymService;
import gym.model.vo.GFile;
import gym.model.vo.Gym;

@WebServlet("/gymUpdateForm.do")
public class GymUpdateAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GymUpdateAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		
		GymService service = new GymService();
		
		ArrayList<Gym> gList = service.selectGym(gNo);		
		ArrayList<GFile> fList = service.selectGFile(gNo);
		ArrayList gfList = new ArrayList();
		
		gfList.add(gList);
		gfList.add(fList);
		
		for(int i = 0; i < gfList.size(); i++) {
			System.out.println("gymUpdateAjax gfList : " + gfList.get(i));
		}
		
		
		Gson gson = new Gson();
		gson.toJson(gfList, response.getWriter());
		
		response.setContentType("application/json; charset=UTF-8");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
