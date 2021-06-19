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
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/kakaoLogin.me")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		String profile = request.getParameter("profile");
		
		Member mem = new Member(email, pwd, name, gender, "서울시 강남구 역삼동", null, profile, null);
		MemberService mService = new MemberService();
		
		// 이메일 중복 체크
		int eResult = mService.checkEmail(email);
		
		if(eResult == 0) {
			// 중복안됨. 회원가입 해야함
			int result = mService.insertMember(mem);
			
			if(result > 0) {
				// 회원가입 후 로그인
				Member loginUser = new MemberService().loginMember(mem);
				
				if(loginUser != null) {
					request.getSession().setAttribute("loginUser", loginUser);
					response.getWriter().append("/");
				} else {
					request.setAttribute("msg", "로그인 실패");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "회원가입에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			// 중복됨. 바로 로그인
			Member loginUser = new MemberService().loginMember(mem);
			
			if(loginUser != null) {
				request.getSession().setAttribute("loginUser", loginUser);
				response.getWriter().append("/");
			} else {
				request.setAttribute("msg", "로그인 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
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
