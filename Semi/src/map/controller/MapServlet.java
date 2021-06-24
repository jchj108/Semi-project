package map.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import map.model.service.MapService;
import map.model.vo.Map;

@WebServlet("/map.do")
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ArrayList<Map> list = new MapService().selectMap();
		ArrayList<Map> livingList = new ArrayList();
		ArrayList<Map> poolList = new ArrayList();
		ArrayList<Map> soccerList = new ArrayList();
		ArrayList<Map> schoolList = new ArrayList();
		ArrayList<Map> tennisList = new ArrayList();
		ArrayList<Map> golfList = new ArrayList();
		ArrayList<Map> footVolleyList = new ArrayList();
		ArrayList<Map> etcList = new ArrayList();
		
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getG_TYPE_NM().equals("생활체육관")) {
				livingList.add(list.get(i));
			}
			else if(list.get(i).getG_TYPE_NM().equals("수영장")) {
				poolList.add(list.get(i));
			} 
			else if(list.get(i).getG_TYPE_NM().equals("축구장")) {
				soccerList.add(list.get(i));
			} 
			else if(list.get(i).getG_TYPE_NM().equals("학교체육시설")) {
				schoolList.add(list.get(i));
			} 
			else if(list.get(i).getG_TYPE_NM().equals("테니스장")) {
				tennisList.add(list.get(i));
			} 
			else if(list.get(i).getG_TYPE_NM().equals("골프연습장")) {
				golfList.add(list.get(i));
			} 
			else if(list.get(i).getG_TYPE_NM().equals("족구장")) {
				footVolleyList.add(list.get(i));
			} 
			else {
				etcList.add(list.get(i));
			}
		}
		
		if(request.getParameter("type") != null && request.getParameter("type").equals("living")) {
			list = livingList; 
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("pool")) {
			list = poolList;
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("soccer")) {
			list = soccerList;
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("school")) {
			list = schoolList;
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("tennis")) {
			list = tennisList;
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("golf")) {
			list = golfList;
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("footVolley")) {
			list = footVolleyList;
		}
		else if(request.getParameter("type") != null && request.getParameter("type").equals("etc")) {
			list = etcList;
		}
		
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/map/map.jsp";
			request.setAttribute("list", list);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "지도 데이터 조회에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
