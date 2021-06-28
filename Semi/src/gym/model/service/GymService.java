package gym.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import gym.model.dao.GymDAO;
import gym.model.vo.GFile;
import gym.model.vo.Gym;
import member.model.dao.MemberDAO;
import page.model.vo.Page;

public class GymService {

	public ArrayList<Gym> selectGym(int gNo) {
		
		Connection conn = getConnection();

		ArrayList<Gym> list = new GymDAO().selectGym(conn, gNo);
		close(conn);

		return list;
	}
	
	
	
	public ArrayList<Gym> searchGym(String keyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().searchGym(conn, keyword);
		close(conn);
		
		return list;
	}

	public ArrayList<Gym> selectCovidList() {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().selectCovidList(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Gym> selectPopularList() {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().selectPopularList(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Gym> selectRecomendList(String like) {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().selectRecommendList(conn, like);
		close(conn);
		
		return list;
	}

	public ArrayList selectRandomGymList() {
		
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().selectRandomList(conn);
		close(conn);
		
		return list;
	}

	public ArrayList selectLocalList(String gu_nm) {

		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().selectLocalList(conn, gu_nm);
		close(conn);
		
		return list;
	}

	public int gEListCount() {
		
		Connection conn = getConnection();
		
		int count = new GymDAO().gEListCount(conn);
		
		close(conn);
		
		return count;
	}

	public int gListCount(String category) {
		Connection conn = getConnection();
		
		int count = new GymDAO().gListCount(conn, category);
		
		close(conn);
		return count;
	}

	public ArrayList<Gym> selectGList(String category, Page pi) {
		Connection conn = getConnection();
		
		ArrayList<Gym> gList = new GymDAO().selectGList(conn, pi, category);
		
		close(conn);
		
		return gList;
	}

	public ArrayList<Gym> selectGEList(Page pi) {
		Connection conn = getConnection();
		
		ArrayList<Gym> gList = new GymDAO().selectGEList(conn, pi);
		
		close(conn);
		
		return gList;
	}

	public ArrayList<GFile> selectGymThumbList() {
		
		Connection conn = getConnection();
		
		ArrayList<GFile> thumbList = new GymDAO().selectGymThumbList(conn);
		
		close(conn);
		
		return thumbList;
	}

	public int deleteGym(String check) {
		
		Connection conn = getConnection();
		
		int result = 0;
		GymDAO gymDAO = new GymDAO();
		
		String arr[] = check.split(",");
		String gNo = null;
		
		for(int i = 0; i< arr.length; i++) {
			gNo = arr[i];
			result = gymDAO.deleteGym(conn, gNo);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
				break;
			}
		}	
		close(conn);
		return result;
	}

	public ArrayList<GFile> selectGFile(int gNo) {
		
		Connection conn = getConnection();
		
		ArrayList<GFile> gFList = new GymDAO().selectGFile(conn, gNo);
		
		close(conn);
		
		return gFList;
	}
}
