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

import board.model.service.BoardService;
import common.MyFileRenamePolicy;
import gym.model.vo.GFile;
import gym.model.vo.Gym;
import oracle.net.aso.g;

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

		if (ServletFileUpload.isMultipartContent(request)) { // request의 enType이 multipart/form-data로 전송되었는지 확인
			int maxSize = 1024 * 1024 * 10; // 10Mbtye로 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/"); // 웹 서버 컨테이너 경로 추출(webContent 쪽을
																						// 이야기한다)
			String savePath = root + "gym_uploadFiles/";

			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdirs();
			}

			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			// 값을 가져올 준비
			ArrayList<String> saveFiles = new ArrayList<String>(); // 파일의 바뀐 이름을 저장할 공간
			ArrayList<String> originFiles = new ArrayList<String>(); // 파일의 원래 이름을 저장할 공간

			// request와 흡사하게 MultipartRequest에도 getParameter가 존재한다.
			Enumeration<String> files = multipartRequest.getFileNames(); // getFilenames() : 폼에서 전송된 파일 리스트들의
			// enumeration에 이미 거꾸로 담겨 있다.
			// iterator의 이전버전이다. listIterator는 양방향, iterator는 단방향
			while (files.hasMoreElements()) { // hasNext와 같다.
				String name = files.nextElement(); // 이름만 저장한다. 파일 저장은 따로 외부 폴더에 저장된다.
				// getFilesystemName(name) : rename메소드에서 작성한대로 바뀐 파일 명 반환, 파일이 없다면 null
				if (multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name)); // 그대로 들어가면 된다.
					originFiles.add(multipartRequest.getOriginalFileName(name)); // 원래 이름은 getOriginalFilename
					// getOriginalFileName(name) : 실제 사용자가 업로드 할 때의 파일 명 반환
				}
			}
			// multipartRequest를 사용. 인코딩 타입이 multipart이기 때문이다.
			String gymType = multipartRequest.getParameter("gymType");
			String gymName = multipartRequest.getParameter("gymName");
			String gymHomepage = multipartRequest.getParameter("gymHomepage");
			String gymParking = multipartRequest.getParameter("gymParking");
			String gymBigo = multipartRequest.getParameter("gymBigo");
			String addr = multipartRequest.getParameter("gymAddr");
			String[] addrArray = addr.split(" "); // 입력받은 주소를 띄어쓰기로 나눔
			String gu = addrArray[0]; // 첫 번째 배열을 gu에 저장. 구, 동, 상세 주소로 입력받음
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
				if (i == originFiles.size() - 1) { // size는 4가 반환되기 때문에 -1을 해주어야 한다.
					gFile.setgFileLv(0);
				} else {
					gFile.setgFileLv(1);
				}
				System.out.println(gFile);
				fileList.add(gFile);
			}

			int result = new BoardService().insertGym(g, fileList);

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
