package gym.model.vo;

import java.sql.Date;

public class GFile {

	private int gFileNo;
	private int gNo;
	private String gOriginName;
	private String gChangeName;
	private String gFilePath;
	private Date gUploadDate;
	private int gFileLv;
	private char gStatus;

	public GFile() {
	}

	public GFile(int gFileNo, int gNo, String gOriginName, String gChangeName, String gFilePath, Date gUploadDate,
			int gFileLv, char gStatus) {
		super();
		this.gFileNo = gFileNo;
		this.gNo = gNo;
		this.gOriginName = gOriginName;
		this.gChangeName = gChangeName;
		this.gFilePath = gFilePath;
		this.gUploadDate = gUploadDate;
		this.gFileLv = gFileLv;
		this.gStatus = gStatus;
	}

	@Override
	public String toString() {
		return "GFile [gFileNo=" + gFileNo + ", gNo=" + gNo + ", gOriginName=" + gOriginName + ", gChangeName="
				+ gChangeName + ", gFilePath=" + gFilePath + ", gUploadDate=" + gUploadDate + ", gFileLv=" + gFileLv
				+ ", gStatus=" + gStatus + "]";
	}

	public int getgFileNo() {
		return gFileNo;
	}

	public void setgFileNo(int gFileNo) {
		this.gFileNo = gFileNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgOriginName() {
		return gOriginName;
	}

	public void setgOriginName(String gOriginName) {
		this.gOriginName = gOriginName;
	}

	public String getgChangeName() {
		return gChangeName;
	}

	public void setgChangeName(String gChangeName) {
		this.gChangeName = gChangeName;
	}

	public String getgFilePath() {
		return gFilePath;
	}

	public void setgFilePath(String gFilePath) {
		this.gFilePath = gFilePath;
	}

	public Date getgUploadDate() {
		return gUploadDate;
	}

	public void setgUploadDate(Date gUploadDate) {
		this.gUploadDate = gUploadDate;
	}

	public int getgFileLv() {
		return gFileLv;
	}

	public void setgFileLv(int gFileLv) {
		this.gFileLv = gFileLv;
	}

	public char getgStatus() {
		return gStatus;
	}

	public void setgStatus(char gStatus) {
		this.gStatus = gStatus;
	}

}
