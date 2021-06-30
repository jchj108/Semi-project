package gym.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.PageInfo;
import gym.model.vo.GFile;
import gym.model.vo.Gym;
import page.model.vo.Page;

public class GymDAO {
	
	private Properties prop = new Properties();
	public GymDAO() {
		String filename = GymDAO.class.getResource("/sql/gym/gym-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<Gym> selectGymList(Connection conn) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectGymList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"),
							rset.getString("g_TYPE_NM"),
							rset.getString("g_GU_NM"),
							rset.getString("g_NAME"),
							rset.getString("g_ADDRESS"),
							rset.getDouble("g_YCODE"),
							rset.getDouble("g_XCODE"),
							rset.getString("g_TEL"),
							rset.getString("g_EDU_YN"),
							rset.getString("g_IN_OUT"),
							rset.getString("G_STATUS").charAt(0),
							rset.getInt("g_COUNT"),
							rset.getInt("g_COVID"));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	public ArrayList<Gym> searchGym(Connection conn, String keyword) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("searchGym");
		String containKeyword = "%" + keyword + "%";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, containKeyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Gym g = new Gym();
				g.setG_NO(rset.getInt("g_No"));
				g.setG_TYPE_NM(rset.getString("g_type_nm"));
				g.setG_GU_NM(rset.getString("g_gu_nm"));
				g.setG_NAME(rset.getString("g_name"));
				g.setG_ADDRESS(rset.getString("g_address"));
				g.setG_YCODE(rset.getDouble("g_ycode"));
				g.setG_XCODE(rset.getDouble("g_xcode"));
				g.setG_TEL(rset.getString("g_tel"));
				g.setG_EDU_YN(rset.getString("g_edu_yn"));
				g.setG_IN_OUT(rset.getString("g_in_out"));
				
				list.add(g);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public ArrayList<Gym> selectCovidList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectCovidList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"),
							rset.getString("g_TYPE_NM"),
							rset.getString("g_GU_NM"),
							rset.getString("g_NAME"),
							rset.getString("g_ADDRESS"),
							rset.getDouble("g_YCODE"),
							rset.getDouble("g_XCODE"),
							rset.getString("g_TEL"),
							rset.getString("g_EDU_YN"),
							rset.getString("g_IN_OUT"),
							rset.getString("G_STATUS").charAt(0),
							rset.getInt("g_COUNT"),
							rset.getInt("g_COVID"));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}


	public ArrayList<Gym> selectPopularList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectPopularList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"),
							rset.getString("g_TYPE_NM"),
							rset.getString("g_GU_NM"),
							rset.getString("g_NAME"),
							rset.getString("g_ADDRESS"),
							rset.getDouble("g_YCODE"),
							rset.getDouble("g_XCODE"),
							rset.getString("g_TEL"),
							rset.getString("g_EDU_YN"),
							rset.getString("g_IN_OUT"),
							rset.getString("G_STATUS").charAt(0),
							rset.getInt("g_COUNT"),
							rset.getInt("g_COVID"));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}


	public ArrayList<Gym> selectRecommendList(Connection conn, String like) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectRecommendList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, like);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_No"),
								rset.getString("g_type_nm"),
								rset.getString("g_name"));
				list.add(g);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public ArrayList<Gym> selectRandomList(Connection conn) {
	
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectRandomList");
		
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Gym g = new Gym(rset.getInt("g_No"),
							rset.getString("g_type_nm"),
							rset.getString("g_gu_nm"),
							rset.getString("g_name"));
					list.add(g);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return list;
	}


	public ArrayList<Gym> selectLocalList(Connection conn, String gu_nm) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectLocalList");
		
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, gu_nm);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Gym g = new Gym(rset.getInt("g_No"),
									rset.getString("g_type_nm"),
									rset.getString("G_GU_NM"),
									rset.getString("g_name"));
					list.add(g);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		return list;
	}


	public int gEListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("gEListCount");
		
		try {
			stmt = conn.createStatement();
						
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return count;
	}


	public int gListCount(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("gListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}


	public ArrayList<Gym> selectGList(Connection conn, Page pi, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> gList = new ArrayList<Gym>();

		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		String query = prop.getProperty("selectGList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_no"),
						rset.getString("g_name"),
						rset.getString("g_address"),
						rset.getInt("g_covid"),
						rset.getString("g_change_name"));
				gList.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return gList;
	}


	public ArrayList<Gym> selectGEList(Connection conn, Page pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> gList = new ArrayList<Gym>();

		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		
		String query = prop.getProperty("selectGEList");
		
		try {
			pstmt = conn.prepareStatement(query);
				
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_no"),
						rset.getString("g_name"),
						rset.getString("g_address"),
						rset.getInt("g_covid"),
						rset.getString("g_change_name"));
				
				gList.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return gList;
	}

	public ArrayList<GFile> selectGymThumbList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<GFile> thumbList = new ArrayList<GFile>();
		
		String query = prop.getProperty("selectGymThumbList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				GFile gf = new GFile(rset.getInt("g_file_no"),
										 rset.getInt("g_no"),
										 rset.getString("g_origin_name"),
										 rset.getString("g_change_name"),
										 rset.getString("g_file_path"),
										 rset.getDate("g_upload_date"),
										 rset.getInt("g_file_lv"),
										 rset.getString("g_status").charAt(0));
				thumbList.add(gf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return thumbList;
	}


	public int getLocaCount(Connection conn, String loca) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("getLocaCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loca);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}


	public ArrayList<Gym> locationList(Connection conn, Page pi, String loca) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int end = start + pi.getBoardLimit() - 1;
		
		String query = prop.getProperty("locationList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loca);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Gym g = new Gym(rset.getInt("g_no"),
						rset.getString("g_name"),
						rset.getString("g_address"),
						rset.getInt("g_covid"),
						rset.getString("g_change_name"));
				
				list.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
