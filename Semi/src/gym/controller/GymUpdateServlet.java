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
				// getFilesystemName(name) : rename메소드에서 작성한대로 바뀐 파일 명 반환, 파일이 없다면 null
				System.out.println(multipartRequest.getFilesystemName(name));
				
				if (multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name)); // 그대로 들어가면 된다.
					originFiles.add(multipartRequest.getOriginalFileName(name)); // 원래 이름은 getOriginalFilename
					// getOriginalFileName(name) : 실제 사용자가 업로드 할 때의 파일 명 반환
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
			
			System.out.println("updateServlet : " + g);
			
			String[] hiddenImgs = multipartRequest.getParameterValues("hiddenImgs");
			int count = 0;
			
			for(int i = 0; i < hiddenImgs.length; i++) {
				if(!hiddenImgs[i].equals("")) {
					count ++;
				}
			}

			int[] iArr = new int[count];
			
			for(int i = 0; i < hiddenImgs.length; i++) {
				if(!hiddenImgs[i].equals("")) {
					iArr[i] = Integer.parseInt(hiddenImgs[i]);
				}
			}
			
			for(int i = 0; i< iArr.length; i++) {
				System.out.println("iArr: "+iArr[i]);
			}
			
			ArrayList<Integer> originImgList = new ArrayList<Integer>(); // array -> arraylist
			for(int i = 0; i<iArr.length; i++) {
				originImgList.add(iArr[i]);
			}
			
			for(int i : originImgList) {
				System.out.println("originImgList : " + i);
			}
			
			ArrayList<GFile> fileList = new ArrayList<GFile>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				GFile gFile = new GFile();
				
				gFile.setgNo(gymNo);
				gFile.setgFileNo(originImgList.get(i));
				gFile.setgFilePath(savePath);
				gFile.setgOriginName(originFiles.get(i));
				gFile.setgChangeName(saveFiles.get(i));

				// 0이 들어가면 썸네일, 1이면 일반
				
				if (i == originFiles.size() - 1) { // size는 4가 반환되기 때문에 -1을 해주어야 한다.
					gFile.setgFileLv(0);
				} else {
					gFile.setgFileLv(1);
				}
				fileList.add(gFile);
			}
			
			for(GFile gf : fileList) {
				System.out.println("gFList : " + gf);
			}

			int result = new GymService().updateGym(g, fileList);

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
