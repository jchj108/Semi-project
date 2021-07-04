package gym.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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

@WebServlet("/gymUpdate.do")
public class GymUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GymUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
				System.out.println("getfileSystemName : " + multipartRequest.getFilesystemName(name));
				System.out.println("originalfilename : " + multipartRequest.getOriginalFileName(name));
				
				if (multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name)); 
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			int gymNo = Integer.parseInt(multipartRequest.getParameter("gymUpdateNo"));
			String gymType = multipartRequest.getParameter("gymUpdateType");
			String gymName = multipartRequest.getParameter("gymUpdateName");
			String gymHomepage = multipartRequest.getParameter("gymUpdateHomepage");
			String gymParking = multipartRequest.getParameter("gymUpdateParking");
			String gymBigo = multipartRequest.getParameter("gymUpdateBigo");
			String addr = multipartRequest.getParameter("gymUpdateAddr");
			String gymTel = multipartRequest.getParameter("gymUpdateTel");
			String[] addrArray = addr.split(" "); // 입력받은 주소를 띄어쓰기로 나눔
			String gu = addrArray[0]; // 첫 번째 배열을 gu에 저장. 구, 동, 상세 주소로 입력받음
			String edu_yn = multipartRequest.getParameter("edu_yn");
			String in_out = multipartRequest.getParameter("in_out");
			int covid = Integer.parseInt(multipartRequest.getParameter("covid"));
			Gym g = new Gym();
			
			g.setG_NO(gymNo);
			g.setG_TYPE_NM(gymType);
			g.setG_NAME(gymName);
			g.setG_HOMEPAGE(gymHomepage);
			g.setG_PARKING_LOT(gymParking);
			g.setG_BIGO(gymBigo);
			g.setG_ADDRESS(addr);
			g.setG_TEL(gymTel);
			g.setG_GU_NM(gu);
			g.setG_EDU_YN(edu_yn);
			g.setG_IN_OUT(in_out);
			g.setG_COVID(covid);
			
			String[] hiddenImgs = multipartRequest.getParameterValues("hiddenImgs");
			
			ArrayList<Integer> originImgNoList = new ArrayList<Integer>(); // array -> arraylist

			for(int i = 0; i<hiddenImgs.length; i++) {
				if(!hiddenImgs[i].equals("0")) {
				originImgNoList.add(Integer.parseInt(hiddenImgs[i]));
				}
			}
			Collections.reverse(originImgNoList);
			
			ArrayList<GFile> fileList = new ArrayList<GFile>();
			for (int i = originFiles.size() - 1; i >= 0; i--) { // 파일 업로드 횟수만큼
				GFile gFile = new GFile();
				
				gFile.setgNo(gymNo);
				gFile.setgFileNo(originImgNoList.get(i));
				gFile.setgFilePath(savePath);
				gFile.setgOriginName(originFiles.get(i));
				gFile.setgChangeName(saveFiles.get(i));

				fileList.add(gFile);
			}
			
			int result = new GymService().updateGym(g, fileList);

			if (result > 0) {
				response.sendRedirect("gymManage.do");
			} else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete(); // 제대로 가져오지 못하면 지워준다.
				}
				request.setAttribute("msg", "시설 수정에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
