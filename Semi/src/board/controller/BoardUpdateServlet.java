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
import member.model.vo.Member;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boardUpdate.do")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
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
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			
			
			String title = multipartRequest.getParameter("titleInput");
			String body = multipartRequest.getParameter("bodyInput");
			int qNo = Integer.parseInt((multipartRequest.getParameter("qNo")));
			String secret = multipartRequest.getParameter("openChoice");
			String[] fNums = multipartRequest.getParameterValues("fileNo");
			
			Board b = new Board();
			
			b.setQ_body(body);			
			b.setQ_secret(secret);
			b.setQ_title(title);
			b.setQ_no(qNo);
			
			ArrayList<QnaFile> fileList = new ArrayList<QnaFile>();
			
			for(int i = originFiles.size()-1; i >= 0; i--) {
				QnaFile qf = new QnaFile();
				qf.setQ_file(savePath);
				qf.setOriginName(originFiles.get(i));
				qf.setChangeName(saveFiles.get(i));
				if(fNums != null) {
					for(int j = 0; j < fNums.length; j++) {
						qf.setQ_file_no(Integer.parseInt(fNums[j]));
					}
				}
				fileList.add(qf);
				
			}
			
			int result = new BoardService().updateBoard(b, fileList);
			
			if(result > 0) {
				response.sendRedirect("detailBoard.do?qNo=" + qNo);			
			} else {		
				request.setAttribute("msg", "게시글 수정이 실패하였습니다.");
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
