package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Comments;
import board.model.vo.QnaFile;

/**
 * Servlet implementation class AdminBoardDetailServlet
 */
@WebServlet("/adminBoardDetail.ad")
public class AdminBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		BoardService bService = new BoardService();
		
		Board b = bService.detailBoard(qNo);
		
		ArrayList<QnaFile> fileList = bService.selectFile(qNo);
		
		ArrayList<Comments> cList = bService.selectComment(qNo);
		
		String page = null;
		if(b != null) {
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
			request.setAttribute("cList", cList);
			page = "WEB-INF/views/board/adminBoardDetail.jsp";
		} else {
			request.setAttribute("msg", "게시글 조회에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
