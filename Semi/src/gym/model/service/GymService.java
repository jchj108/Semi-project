package gym.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.PageInfo;
import gym.model.dao.GymDAO;
import gym.model.vo.GFile;
import gym.model.vo.Gym;
import page.model.vo.Page;

public class GymService {

	public ArrayList<Gym> selectGym() {
		
		Connection conn = getConnection();

		ArrayList<Gym> list = new GymDAO().selectGymList(conn);
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

	public int getLocaCount(String loca) {
		Connection conn = getConnection();
		
		int count = new GymDAO().getLocaCount(conn, loca);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Gym> locationList(Page pi, String loca) {
		Connection conn = getConnection();
		
		ArrayList<Gym> list = new GymDAO().locationList(conn, pi, loca);
		
		close(conn);
		return list;
	}

}
