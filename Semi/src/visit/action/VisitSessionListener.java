package visit.action;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import visit.model.VisitCountDAO;

public class VisitSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		
		// 세션이 새로 생성되면 execute() 실행
		if(sessionEve.getSession().isNew()) {
			execute(sessionEve);
		}
	}

	private void execute(HttpSessionEvent sessionEve) {
		VisitCountDAO dao = VisitCountDAO.getInstance();
		
		try {
			// 전체 방문자 수 증가
			dao.setTotalCount();
			// 총 방문자 수
			int totalCount = dao.getTotalCount();
			// 오늘 방문자 수
			int todayCount = dao.getTodayCount();
			
			HttpSession session = sessionEve.getSession();
			
			// 세션에 방문자 수 담음
			session.setAttribute("totalCount", totalCount);
			session.setAttribute("todayCount", todayCount);
			
			System.out.println(totalCount + " : 총 방문자수");
			System.out.println(todayCount + " : 오늘 방문자수");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {}
}
