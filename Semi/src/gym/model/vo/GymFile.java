package gym.model.vo;

public class GymFile {

	private int G_FILE_NO;
	private String G_FILE;
	private int G_FILE_LV;
	private char G_STATUS;
	private int G_NO;

	public int getG_FILE_NO() {
		return G_FILE_NO;
	}

	public void setG_FILE_NO(int g_FILE_NO) {
		G_FILE_NO = g_FILE_NO;
	}

	public String getG_FILE() {
		return G_FILE;
	}

	public void setG_FILE(String g_FILE) {
		G_FILE = g_FILE;
	}

	public int getG_FILE_LV() {
		return G_FILE_LV;
	}

	public void setG_FILE_LV(int g_FILE_LV) {
		G_FILE_LV = g_FILE_LV;
	}

	public char getG_STATUS() {
		return G_STATUS;
	}

	public void setG_STATUS(char g_STATUS) {
		G_STATUS = g_STATUS;
	}

	public int getG_NO() {
		return G_NO;
	}

	public void setG_NO(int g_NO) {
		G_NO = g_NO;
	}

	public GymFile() {
	}

	public GymFile(int g_FILE_NO, String g_FILE, int g_FILE_LV, char g_STATUS, int g_NO) {
		super();
		G_FILE_NO = g_FILE_NO;
		G_FILE = g_FILE;
		G_FILE_LV = g_FILE_LV;
		G_STATUS = g_STATUS;
		G_NO = g_NO;
	}

	@Override
	public String toString() {
		return "GymFile [G_FILE_NO=" + G_FILE_NO + ", G_FILE=" + G_FILE + ", G_FILE_LV=" + G_FILE_LV + ", G_STATUS="
				+ G_STATUS + ", G_NO=" + G_NO + "]";
	}

}
