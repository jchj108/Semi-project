package member.controller;


import static common.Encrypt.getEncryptPwd;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
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
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			int mNo = ((Member)request.getSession().getAttribute("loginUser")).getM_no();
			
			String profile = multi.getFilesystemName("updateProfile");
			if(profile == null) {
				profile = ((Member)request.getSession().getAttribute("loginUser")).getM_profile();
			}
			
			String pwd = null;
			String updatePwd = multi.getParameter("pwd2");
			if(updatePwd.equals("")) {
				pwd = ((Member)request.getSession().getAttribute("loginUser")).getM_pwd();
			} else {
				pwd = getEncryptPwd(updatePwd);
			}
			
			char gender = multi.getParameter("gender").charAt(0);
			String address = multi.getParameter("updateAddress");
			String etc = multi.getParameter("updateEtc");
			String like = multi.getParameter("updateLike");
			
			Member m = new Member(mNo, pwd, gender, address, etc, profile, like);
			
			int result = new MemberService().updateMember(m);
			
			if(result > 0) {
				response.sendRedirect("myPage.me");
			} else {
				request.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
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
