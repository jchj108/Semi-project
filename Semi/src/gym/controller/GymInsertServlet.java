package gym.controller;

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
import gym.model.service.GymService;
import gym.model.vo.GFile;
import gym.model.vo.Gym;

/**
 * Servlet implementation class GymInsertServlet
 */
@WebServlet("/insert.fc")
public class GymInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GymInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) { 
			int maxSize = 1024 * 1024 * 10; // 10Mbtye로 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/"); 
			String savePath = root + "gym_uploadFiles/";

			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdirs();
			}

			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>(); 
			
			Enumeration<String> files = multipartRequest.getFileNames(); 
			
			while (files.hasMoreElements()) { 
				String name = files.nextElement(); 
				if (multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name)); 
					originFiles.add(multipartRequest.getOriginalFileName(name)); 
				}
			}
			String gymType = multipartRequest.getParameter("gymType");
			String gymName = multipartRequest.getParameter("gymName");
			String gymHomepage = multipartRequest.getParameter("gymHomepage");
			String gymParking = multipartRequest.getParameter("gymParking");
			String gymBigo = multipartRequest.getParameter("gymBigo");
			String addr = multipartRequest.getParameter("gymAddr");
			
			String[] addrArray = addr.split(" "); // 입력받은 주소를 띄어쓰기로 나눔
			String[] guArr = {"강남구", "강동구", "강서구", "강북구", "관악구", "광진구", "구로구", "금천구", 
							  "노원구", "동대문구", "도봉구", "동작구", "마포구", "서대문구", "성동구", "성북구", "서초구", "송파구",
							  "영등포구", "용산구", "양천구", "은평구", "종로구", "중구", "중랑구"};
			String gu= "-";
			loop: // 다중 루프 빠져나오기
			for(int i = 0; i<addrArray.length; i++) {
				for(int j = 0; j < guArr.length; j++) {
					if(addrArray[i].equals(guArr[j])) {
						gu = guArr[j];
						break loop;
					} 
				}
			}
			
			String edu_yn = multipartRequest.getParameter("edu_yn");
			String in_out = multipartRequest.getParameter("in_out");
			int covid = Integer.parseInt(multipartRequest.getParameter("covid"));

			Gym g = new Gym();
			
			g.setG_TYPE_NM(gymType);
			g.setG_NAME(gymName);
			g.setG_HOMEPAGE(gymHomepage);
			g.setG_PARKING_LOT(gymParking);
			g.setG_BIGO(gymBigo);
			g.setG_ADDRESS(addr);
			g.setG_GU_NM(gu);
			g.setG_EDU_YN(edu_yn);
			g.setG_IN_OUT(in_out);
			g.setG_COVID(covid);
			
			ArrayList<GFile> fileList = new ArrayList<GFile>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				GFile gFile = new GFile();
				gFile.setgFilePath(savePath);
				gFile.setgOriginName(originFiles.get(i));
				gFile.setgChangeName(saveFiles.get(i));

				// 0이 들어가면 썸네일, 1이면 일반
				if (i == originFiles.size() - 1) {
					gFile.setgFileLv(0);
				} else {
					gFile.setgFileLv(1);
				}
				System.out.println(gFile);
				fileList.add(gFile);
			}

			int result = new GymService().insertGym(g, fileList);
			
			
			if (result > 0) {
				response.sendRedirect("gymManage.do");
			} else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete(); // 제대로 가져오지 못하면 지워준다.
				}
				request.setAttribute("msg", "시설 등록에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
