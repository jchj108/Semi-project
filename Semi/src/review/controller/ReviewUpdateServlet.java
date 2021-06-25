package review.controller;

import java.io.File;
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

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewAttachment;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/reviewUpdate.re")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
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
			String savePath = root + "review_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
		  
			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			ArrayList<String> originFiles = new ArrayList<String>();	// 파일의 원래 이름을 저장할 공간
			ArrayList<String> saveFiles = new ArrayList<String>();		// 파일의 바뀐 이름을 저장할 공간
			
			Enumeration<String> files = mr.getFileNames(); 
			
			// file의 name 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println(name + ": names!");
				
				System.out.println(mr.getFilesystemName(name) + ": 시스템 이름");
				
				if(mr.getFilesystemName(name) != null) {
					originFiles.add(mr.getOriginalFileName(name));
					saveFiles.add(mr.getFilesystemName(name));
				}
			}
			
			ArrayList<ReviewAttachment> fileList = new ArrayList<ReviewAttachment>();
			
			for(int i = 1; i >= 0; i--) {
				System.out.println(originFiles.get(i) + " : 인덱스 0, 1원래");
				
				ReviewAttachment ra = new ReviewAttachment();
				ra.setR_file_path(savePath);
				ra.setR_origin_name(originFiles.get(i));
				ra.setR_change_name(saveFiles.get(i));
				
				fileList.add(ra);
			}
			
			for(int i = originFiles.size()-1; i >= 2; i--) {
				System.out.println(originFiles.get(i) + " : 인덱스 거꾸로");
				
				ReviewAttachment ra = new ReviewAttachment();
				ra.setR_file_path(savePath);
				ra.setR_origin_name(originFiles.get(i));
				ra.setR_change_name(saveFiles.get(i));
				
				fileList.add(ra);
			}
			
			Member loginUser = ((Member)request.getSession().getAttribute("loginUser"));
			String name = loginUser.getM_name();
			int no = loginUser.getM_no();
			int totalStar = Integer.parseInt(mr.getParameter("totalStar"));
			int facilityStar =  Integer.parseInt(mr.getParameter("facilityStar"));
			int instructorStar =  Integer.parseInt(mr.getParameter("instructorStar"));
			int serviceStar =  Integer.parseInt(mr.getParameter("serviceStar"));
			int priceStar =  Integer.parseInt(mr.getParameter("priceStar"));
			String keywordArr[] = mr.getParameterValues("keyword");
			String reviewText = mr.getParameter("reviewText");
			
			String keyword = "";
			if(keywordArr != null) {
				for(int i = 0; i < keywordArr.length; i++) {
					if(i == keywordArr.length-1) {
						keyword += keywordArr[i];
					} else {
						keyword += keywordArr[i] + ", ";
					}
				}
			}
			
			System.out.println(totalStar + ": 총");
			System.out.println(facilityStar + ": 시설");
			System.out.println(instructorStar + ": 강사");
			System.out.println(serviceStar + ": 서비스");
			System.out.println(priceStar + ": 가격");
			
			Review r = new Review();
			r.setR_body(reviewText);
			r.setR_total(totalStar);
			r.setR_teacher(instructorStar);
			r.setR_service(serviceStar);
			r.setR_gym(facilityStar);
			r.setR_price(priceStar);
			r.setR_keyword(keyword);
			r.setReviewerName(name);
			r.setReviewerNo(no);
			
//			int result = new ReviewService().updateReview(fileList, r);
			
			
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
