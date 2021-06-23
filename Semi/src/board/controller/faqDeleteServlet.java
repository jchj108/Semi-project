package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class faqDeleteServlet
 */
@WebServlet("/faqDelete.ad")
public class faqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		int result = new BoardService().deleteBoard(check);
		
		if(result > 0) {
			response.sendRedirect("faqBoardList.li");
		} else {
			request.setAttribute("msg", "게시글 삭제에 실패하였습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
