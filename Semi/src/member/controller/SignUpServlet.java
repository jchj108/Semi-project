package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/signUp.me")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
				
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		String address = request.getParameter("address");
		String etc = request.getParameter("etc");
		String profile = request.getParameter("profile");
		String like = request.getParameter("like");
		
		Member mem = new Member(email, pwd, name, gender, address, etc, profile, like);
		
		int result = new MemberService().insertMember(mem);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);;
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
