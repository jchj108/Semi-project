package gym.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.model.service.GymService;

@WebServlet("/gymDelete.do")
public class GymDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GymDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String irr[] = request.getParameterValues("check");
		String check = "";
		
		if(irr != null) {
			for(int i = 0; i < irr.length; i++) {
				if(i == irr.length - 1) {
					check += irr[i];
				} else {
					check += irr[i] + ",";
				}
			}
		}
		
		System.out.println("check = " + check);
		
		int result = new GymService().deleteGym(check);
		
		if(result > 0) {
			response.sendRedirect("gymManage.do");
		} else {
			request.setAttribute("msg", "게시글 삭제에 실패하였습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
