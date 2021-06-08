package board.model.dao;

import java.io.FileNotFoundException;
import static common.JDBCTemplate.close;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class BoardDAO {
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String filename = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
}
