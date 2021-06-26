package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.QnaFile;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boardUpdateForm.do")
public class BoardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			BoardService bService = new BoardService();
		
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/"); 
			String savePath = root + "board_uploadFiles/";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
									
			int qNo = Integer.parseInt(multipartRequest.getParameter("qNo"));
						
			Board b = bService.detailBoard(qNo);
			ArrayList<QnaFile> fileList = bService.selectFile(qNo);			
			
			
			String page = null;
			if(b != null) {
				request.setAttribute("b", b);
				request.setAttribute("fileList", fileList);
				
				page = "WEB-INF/views/board/boardUpdateForm.jsp";
			} else {
				request.setAttribute("msg", "게시글 조회에 실패하였습니다.");
				page = "WEB-INF/views/common/errorPage.jsp";
			}
			
			request.getRequestDispatcher(page).forward(request, response);
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
