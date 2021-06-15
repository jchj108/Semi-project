package gym.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import gym.model.dao.GymDAO;
import gym.model.vo.Gym;

public class GymService {

	public ArrayList<Gym> selectGym() {
		
		Connection conn = getConnection();

		ArrayList<Gym> list = new GymDAO().selectGymList(conn);
		close(conn);

		return list;
	}
}
