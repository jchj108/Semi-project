package member.controller;

import static common.Encrypt.getEncryptPwd;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
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
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "profile_uploadFiles/";
			
			File file = new File(savePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String saveFiles = null;
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			if(files.hasMoreElements()) {
				String name = files.nextElement();

				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles = multipartRequest.getFilesystemName(name);
				}
			}
			
			String email = multipartRequest.getParameter("signUpEmail");
			String pwd = getEncryptPwd(multipartRequest.getParameter("signUpPwd"));
			String name = multipartRequest.getParameter("signUpName");
			char gender = multipartRequest.getParameter("signUpGender").charAt(0);
			String address = multipartRequest.getParameter("signUpAddress");
			String etc = multipartRequest.getParameter("signUpEtc");
			String profile = saveFiles;
			String like = multipartRequest.getParameter("signUpLike");
			
			Member mem = new Member(email, pwd, name, gender, address, etc, profile, like);
				
			int result = new MemberService().insertMember(mem);
			
			if(result > 0) {
				Member loginUser = new MemberService().loginMember(mem);
				
				if(loginUser != null) {
					request.getSession().setAttribute("loginUser", loginUser);
					response.sendRedirect(request.getContextPath());
				} else {
					request.setAttribute("msg", "로그인 실패");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "회원가입에 실패하였습니다.");
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
