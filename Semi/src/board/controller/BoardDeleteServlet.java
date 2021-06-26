package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/deleteBoard.do")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
					
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/"); 
			String savePath = root + "board_uploadFiles/";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
									
			String qNo = multipartRequest.getParameter("qNo");
			char bDiv = multipartRequest.getParameter("bDiv").charAt(0);
			
			int result = new BoardService().deleteOneboard(qNo);
			
			if(result > 0) {
				if(bDiv == 'Q') {
					response.sendRedirect("qna.do");
				} else {
					response.sendRedirect("faq.do");
				}
			} else {
				request.setAttribute("msg", "게시글 삭제에 실패하였습니다");
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
