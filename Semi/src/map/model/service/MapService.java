package map.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import map.model.dao.MapDAO;
import map.model.vo.Map;

public class MapService {

	public ArrayList<Map> selectMap() {
		
		Connection conn = getConnection();

		ArrayList<Map> list = new MapDAO().selectMap(conn);
		close(conn);

		return list;
		
	}

}
