package member.common;

import java.sql.Connection;
import java.util.Properties;

public class JDBCTemplate {

	private JDBCTemplate() {}
	
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = null;
		
		String fileName = JDBCTemplate.class.getResource("/sql/driver.properties").getPath();	
		
		
		
		return conn;
	}
	
}
