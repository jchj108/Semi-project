package comments.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CommentsDAO {
	private Properties prop = new Properties();
	
	public CommentsDAO() {
		String filename = CommentsDAO.class.getResource("/sql/comments/comments-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

}
