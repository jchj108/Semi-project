package map.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import map.model.vo.Map;

public class MapDAO {
	
	private Properties prop = new Properties();
	public MapDAO() {
		String filename = MapDAO.class.getResource("/sql/map/map-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<Map> selectMap(Connection conn) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Map> list = new ArrayList<Map>();
		
		String query = prop.getProperty("selectMap");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Map m = new Map(rset.getInt("g_NO"),
							rset.getString("g_TYPE_NM"),
							rset.getString("g_GU_NM"),
							rset.getString("g_NAME"),
							rset.getString("g_ADDRESS"),
							rset.getDouble("g_YCODE"),
							rset.getDouble("g_XCODE"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
}
