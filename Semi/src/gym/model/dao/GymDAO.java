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
			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"), rset.getString("g_TYPE_NM"), rset.getString("g_GU_NM"),
						rset.getString("g_NAME"), rset.getString("g_ADDRESS"), rset.getDouble("g_YCODE"),
						rset.getDouble("g_XCODE"), rset.getString("g_TEL"), rset.getString("g_EDU_YN"),
						rset.getString("g_IN_OUT"), rset.getString("G_STATUS").charAt(0), rset.getInt("g_COUNT"),
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

			while (rset.next()) {
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

			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"), rset.getString("g_TYPE_NM"), rset.getString("g_GU_NM"),
						rset.getString("g_NAME"), rset.getString("g_ADDRESS"), rset.getDouble("g_YCODE"),
						rset.getDouble("g_XCODE"), rset.getString("g_TEL"), rset.getString("g_EDU_YN"),
						rset.getString("g_IN_OUT"), rset.getString("G_STATUS").charAt(0), rset.getInt("g_COUNT"),
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

			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_NO"), rset.getString("g_TYPE_NM"), rset.getString("g_GU_NM"),
						rset.getString("g_NAME"), rset.getString("g_ADDRESS"), rset.getDouble("g_YCODE"),
						rset.getDouble("g_XCODE"), rset.getString("g_TEL"), rset.getString("g_EDU_YN"),
						rset.getString("g_IN_OUT"), rset.getString("G_STATUS").charAt(0), rset.getInt("g_COUNT"),
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

			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_No"), rset.getString("g_type_nm"), rset.getString("g_name"));
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

			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_No"), rset.getString("g_type_nm"), rset.getString("g_gu_nm"),
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
			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_No"), rset.getString("g_type_nm"), rset.getString("G_GU_NM"),
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

			if (rset.next()) {
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

			if (rset.next()) {
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

			while (rset.next()) {
				GFile gf = new GFile(rset.getInt("g_file_no"), rset.getInt("g_no"), rset.getString("g_origin_name"),
						rset.getString("g_change_name"), rset.getString("g_file_path"), rset.getDate("g_upload_date"),
						rset.getInt("g_file_lv"), rset.getString("g_status").charAt(0));
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

	public ArrayList<Gym> recommendGym(Connection conn, Gym rGym) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Gym gym = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String gymType = rGym.getG_TYPE_NM();
		String locationStr = rGym.getG_GU_NM();
		String[] locationArr = locationStr.split(",");
		String lecture = rGym.getG_EDU_YN();
		String inout = rGym.getG_IN_OUT();
		String parking = rGym.getG_PARKING_LOT();
		
		try {
			String query = null;
			if (locationArr.length == 1) {
				String location = locationArr[0];
				if (gymType.equals("개인")) {

					if (parking.equals("유")) {
						System.out.println("개인 / 주차가능 접근 성공");
						query = prop.getProperty("re1AloneParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, location);
						pstmt.setString(2, "%골프%");
						pstmt.setString(3, "%수영%");
						pstmt.setString(4, inout);
						pstmt.setString(5, lecture);
						pstmt.setString(6, "%불가%");
					} else {
						System.out.println("개인 / 주차불가능 접근 성공");
						query = prop.getProperty("re1AloneNoParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, location);
						pstmt.setString(2, "%골프%");
						pstmt.setString(3, "%수영%");
						pstmt.setString(4, inout);
						pstmt.setString(5, lecture);
					}

				} else {
					if (parking.equals("유")) {
						System.out.println("단체 / 주차가능 접근성공");
						query = prop.getProperty("re1TogetherParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, location);
						pstmt.setString(2, "%축구%");
						pstmt.setString(3, "%족구%");
						pstmt.setString(4, "%테니스%");
						pstmt.setString(5, "%배드민턴%");
						pstmt.setString(6, "%농구%");
						pstmt.setString(7, inout);
						pstmt.setString(8, lecture);
						pstmt.setString(9, "%불가%");
					} else {
						System.out.println("단체 / 주차불가능 접근성공");
						query = prop.getProperty("re1TogetherNoParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, location);
						pstmt.setString(2, "%축구%");
						pstmt.setString(3, "%족구%");
						pstmt.setString(4, "%테니스%");
						pstmt.setString(5, "%배드민턴%");
						pstmt.setString(6, "%농구%");
						pstmt.setString(7, inout);
						pstmt.setString(8, lecture);
					}
				}
			} else if (locationArr.length == 2) {
				if (gymType.equals("개인")) {
					if (parking.equals("유")) {
						System.out.println("2개/개인/주차가능 접근성공");
						query = prop.getProperty("re2AloneParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, "%골프%");
						pstmt.setString(4, "%수영%");
						pstmt.setString(5, inout);
						pstmt.setString(6, lecture);
						pstmt.setString(7, "%불가%");
					} else {
						System.out.println("2개/개인/주차불가능 접근성공");
						query = prop.getProperty("re2AloneNoParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, "%골프%");
						pstmt.setString(4, "%수영%");
						pstmt.setString(5, inout);
						pstmt.setString(6, lecture);
					}
				} else {
					if (parking.equals("유")) {
						System.out.println("2개/단체/주차가능");
						query = prop.getProperty("re2TogetherParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, "%축구%");
						pstmt.setString(4, "%족구%");
						pstmt.setString(5, "%테니스%");
						pstmt.setString(6, "%배드민턴%");
						pstmt.setString(7, "%농구%");
						pstmt.setString(8, inout);
						pstmt.setString(9, lecture);
						pstmt.setString(10, "%불가%");
					} else {
						System.out.println("2개/단체/주차불가능");
						query = prop.getProperty("re2TogetherNoParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, "%축구%");
						pstmt.setString(4, "%족구%");
						pstmt.setString(5, "%테니스%");
						pstmt.setString(6, "%배드민턴%");
						pstmt.setString(7, "%농구%");
						pstmt.setString(8, inout);
						pstmt.setString(9, lecture);
					}

				}
			} else if (locationArr.length == 3) {
				if (gymType.equals("개인")) {
					if (parking.equals("유")) {
						System.out.println("3개/개인/주차가능 접근 성공");
						query = prop.getProperty("re3AloneParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, locationArr[2]);
						pstmt.setString(4, "%골프%");
						pstmt.setString(5, "%수영%");
						pstmt.setString(6, inout);
						pstmt.setString(7, lecture);
						pstmt.setString(8, "%불가%");
					} else {
						System.out.println("3개/개인/주차불가능 접근 성공");
						query = prop.getProperty("re3AloneNoParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, locationArr[2]);
						pstmt.setString(4, "%골프%");
						pstmt.setString(5, "%수영%");
						pstmt.setString(6, inout);
						pstmt.setString(7, lecture);
					}

				} else {
					if (parking.equals("유")) {
						System.out.println("3개/단체/주차가능 접근 성공");
						query = prop.getProperty("re3TogetherParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, locationArr[2]);
						pstmt.setString(4, "%축구%");
						pstmt.setString(5, "%족구%");
						pstmt.setString(6, "%테니스%");
						pstmt.setString(7, "%배드민턴%");
						pstmt.setString(8, "%농구%");
						pstmt.setString(9, inout);
						pstmt.setString(10, lecture);
						pstmt.setString(11, "%불가%");
					} else {
						System.out.println("3개/단체/주차불가능 접근 성공");
						query = prop.getProperty("re3TogetherNoParking");

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, locationArr[0]);
						pstmt.setString(2, locationArr[1]);
						pstmt.setString(3, locationArr[2]);
						pstmt.setString(4, "%축구%");
						pstmt.setString(5, "%족구%");
						pstmt.setString(6, "%테니스%");
						pstmt.setString(7, "%배드민턴%");
						pstmt.setString(8, "%농구%");
						pstmt.setString(9, inout);
						pstmt.setString(10, lecture);
					}
				}
			}

			rset = pstmt.executeQuery();
			while (rset.next()) {
				gym = new Gym(rset.getInt("G_NO"), rset.getString("G_TYPE_NM"), rset.getString("G_NAME"));

				list.add(gym);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
		
	public int deleteGym(Connection conn, String gNo) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteGym");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(gNo));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<GFile> selectGFile(Connection conn, int gNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GFile> gFileList = new ArrayList<GFile>();

		String query = prop.getProperty("selectGFile");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				GFile gf = new GFile(rset.getInt("g_file_no"), rset.getInt("g_no"), rset.getString("g_origin_name"),
						rset.getString("g_change_name"), rset.getString("g_file_path"), rset.getDate("g_upload_date"),
						rset.getInt("g_file_lv"), rset.getString("g_status").charAt(0));
				gFileList.add(gf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return gFileList;
	}

	public ArrayList<Gym> selectGym(Connection conn, int gNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> gym = new ArrayList<Gym>();

		String query = prop.getProperty("selectGym");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Gym g = new Gym(rset.getInt("g_No"), rset.getString("g_type_nm"), rset.getString("g_gu_nm"),
						rset.getString("g_name"), rset.getString("g_address"), rset.getDouble("g_ycode"),
						rset.getDouble("g_xcode"), rset.getString("g_tel"), rset.getString("g_edu_yn"),
						rset.getString("g_in_out"), rset.getString("g_status").charAt(0), rset.getInt("g_count"),
						rset.getInt("g_covid"), rset.getString("g_home_page"), rset.getString("g_parking_Lot"),
						rset.getString("g_bigo"));
				gym.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return gym;
	}

	//UPDATE GYM SET G_TYPE = ?, G_NAME = ?, G_HOME_PAGE = ?, G_PARKING_LOT = ?, G_BIGO = ?, G_ADDRESS = ?, G_GU_NM = ?, G_EDU_YN=?, G_IN_OUT=?, G_COVID=? WHERE G_NO = ?
	public int updateGym(Connection conn, Gym g) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateGym");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getG_TYPE_NM());
			pstmt.setString(2, g.getG_NAME());
			pstmt.setString(3, g.getG_HOMEPAGE());
			pstmt.setString(4, g.getG_TEL());
			pstmt.setString(5, g.getG_PARKING_LOT());
			pstmt.setString(6, g.getG_BIGO());
			pstmt.setString(7, g.getG_ADDRESS());
			pstmt.setString(8, g.getG_GU_NM());
			pstmt.setString(9, g.getG_EDU_YN());
			pstmt.setString(10, g.getG_IN_OUT());
			pstmt.setInt(11, g.getG_COVID());
			pstmt.setInt(12, g.getG_NO());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateGFile(Connection conn, ArrayList<GFile> fileList) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		//UPDATE GFILE SET G_ORIGIN_NAME = ?, G_CHANGE_NAME = ?, G_FILE_PATH=?, G_FILE_LV = ? WHERE G_NO=? AND G_FILE_NO = ?
		String query = prop.getProperty("updateGFile");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				GFile f = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, f.getgOriginName());
				pstmt.setString(2, f.getgChangeName());
				pstmt.setString(3, f.getgFilePath());
				pstmt.setInt(4, f.getgFileLv());
				pstmt.setInt(5, f.getgNo());
				pstmt.setInt(6, f.getgFileNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertGym(Connection conn, Gym g) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGym");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getG_TYPE_NM());
			pstmt.setString(2, g.getG_GU_NM());
			pstmt.setString(3, g.getG_NAME());
			pstmt.setString(4, g.getG_ADDRESS());
			pstmt.setString(5, g.getG_TEL());
			pstmt.setString(6, g.getG_BIGO());
			pstmt.setString(7, g.getG_HOMEPAGE());
			pstmt.setString(8, g.getG_EDU_YN());
			pstmt.setString(9, g.getG_IN_OUT());
			pstmt.setString(10, g.getG_PARKING_LOT());
			pstmt.setInt(11, g.getG_COVID());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertGFile(Connection conn, ArrayList<GFile> fileList) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGFile");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				GFile f = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, f.getgOriginName());
				pstmt.setString(2, f.getgChangeName());
				pstmt.setString(3, f.getgFilePath());
				pstmt.setInt(4, f.getgFileLv());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getGymListCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("gymListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	public int getSearchGymListCount(Connection conn, String keyword, String category) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = null;
		
		switch(category) {

	
		case "이름" : 
			query = prop.getProperty("getSearchGymListCountByName"); 
			break;
		case "시설번호" :
			query = prop.getProperty("getSearchGymListCountByNo"); 
			break;
		case "군/구" :
			query = prop.getProperty("getSearchGymListCountByGu"); 
			break;
		case "타입" :
			query = prop.getProperty("getSearchGymListCountByType"); 
			break;
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Gym> searchGym(Connection conn, String keyword, String category, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		String query = null;

		switch(category) {
		
		case "시설번호" :
			query = prop.getProperty("searchByNo"); break;
		case "이름" :
			query = prop.getProperty("searchByName"); break;
		case "타입" :
			query = prop.getProperty("searchByType"); break;
		case "군/구" :
			query = prop.getProperty("searchByGu"); break;
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
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
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Gym> selectGymList(Connection conn, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Gym> list = new ArrayList<Gym>();
		
		String query = prop.getProperty("selectGymLists");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
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
			close(pstmt);
		}

		return list;
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

	
	public Gym selectGymInfo(Connection conn, String gNo) {
		PreparedStatement pstmt = null;
		Gym g = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectGymInfo");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(gNo));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				g = new Gym(rset.getInt("g_no"),
								  rset.getString("g_type_nm"),
								  rset.getString("g_gu_nm"),
								  rset.getString("g_name"),
								  rset.getString("g_address"),
								  rset.getDouble("g_ycode"),
								  rset.getDouble("g_xcode"),
								  rset.getString("g_tel"),
								  rset.getString("g_edu_yn"),
								  rset.getString("g_in_out"),
								  rset.getString("g_status").charAt(0),
								  rset.getInt("g_count"),
								  rset.getInt("g_covid"),
								  rset.getString("g_home_page"),
								  rset.getString("g_parking_lot"),
								  rset.getString("g_bigo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
    return g;
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}


	public int updateCount(Connection conn, String gNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(gNo));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<GFile> selectImage(Connection conn, String gNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GFile> list = new ArrayList<GFile>();
		
		String query = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(gNo));
			rset = pstmt.executeQuery();
			while(rset.next()) {
				GFile gf = new GFile();
				
				gf.setgNo(rset.getInt("g_no"));
				gf.setgFileNo(rset.getInt("g_file_no"));
				gf.setgFileLv(rset.getInt("g_file_lv"));
				gf.setgFilePath(rset.getString("g_file_path"));
				
				list.add(gf);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

}
