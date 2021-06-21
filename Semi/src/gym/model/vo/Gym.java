package gym.model.vo;

public class Gym {

	private int G_NO;
	private String G_TYPE_NM;
	private String G_GU_NM;
	private String G_NAME;
	private String G_ADDRESS;
	private double G_YCODE;
	private double G_XCODE;
	private String G_TEL;
	private String G_EDU_YN;
	private String G_IN_OUT;
	private char G_STATUS; 
	private int G_COUNT;
	private int G_COVID;
	private String G_FILE;
	
	public int getG_NO() {
		return G_NO;
	}

	public String getG_FILE() {
		return G_FILE;
	}

	public Gym(int g_NO, String g_TYPE_NM, String g_GU_NM, String g_NAME, String g_FILE) {
		super();
		G_NO = g_NO;
		G_TYPE_NM = g_TYPE_NM;
		G_GU_NM = g_GU_NM;
		G_NAME = g_NAME;
		G_FILE = g_FILE;
	}

	public Gym(int g_NO, String g_TYPE_NM, String g_GU_NM, String g_NAME, String g_ADDRESS, double g_YCODE,
			double g_XCODE, String g_TEL, String g_EDU_YN, String g_IN_OUT, char g_STATUS, int g_COUNT, int g_COVID,
			String g_FILE) {
		super();
		G_NO = g_NO;
		G_TYPE_NM = g_TYPE_NM;
		G_GU_NM = g_GU_NM;
		G_NAME = g_NAME;
		G_ADDRESS = g_ADDRESS;
		G_YCODE = g_YCODE;
		G_XCODE = g_XCODE;
		G_TEL = g_TEL;
		G_EDU_YN = g_EDU_YN;
		G_IN_OUT = g_IN_OUT;
		G_STATUS = g_STATUS;
		G_COUNT = g_COUNT;
		G_COVID = g_COVID;
		G_FILE = g_FILE;
	}

	public Gym(int g_NO, String g_TYPE_NM, String g_NAME, String g_FILE) {
		super();
		G_NO = g_NO;
		G_TYPE_NM = g_TYPE_NM;
		G_NAME = g_NAME;
		G_FILE = g_FILE;
	}

	public void setG_FILE(String g_FILE) {
		G_FILE = g_FILE;
	}

	public char getG_STATUS() {
		return G_STATUS;
	}

	public void setG_STATUS(char g_STATUS) {
		G_STATUS = g_STATUS;
	}

	public int getG_COUNT() {
		return G_COUNT;
	}

	public void setG_COUNT(int g_COUNT) {
		G_COUNT = g_COUNT;
	}

	public int getG_COVID() {
		return G_COVID;
	}

	public void setG_COVID(int g_COVID) {
		G_COVID = g_COVID;
	}

	public void setG_NO(int g_NO) {
		G_NO = g_NO;
	}

	public String getG_TYPE_NM() {
		return G_TYPE_NM;
	}

	public void setG_TYPE_NM(String g_TYPE_NM) {
		G_TYPE_NM = g_TYPE_NM;
	}

	public String getG_GU_NM() {
		return G_GU_NM;
	}

	public void setG_GU_NM(String g_GU_NM) {
		G_GU_NM = g_GU_NM;
	}

	public String getG_NAME() {
		return G_NAME;
	}

	public void setG_NAME(String g_NAME) {
		G_NAME = g_NAME;
	}

	public String getG_ADDRESS() {
		return G_ADDRESS;
	}

	public void setG_ADDRESS(String g_ADDRESS) {
		G_ADDRESS = g_ADDRESS;
	}

	public double getG_YCODE() {
		return G_YCODE;
	}

	public void setG_YCODE(double g_YCODE) {
		G_YCODE = g_YCODE;
	}

	public double getG_XCODE() {
		return G_XCODE;
	}

	public void setG_XCODE(double g_XCODE) {
		G_XCODE = g_XCODE;
	}

	public String getG_TEL() {
		return G_TEL;
	}

	public void setG_TEL(String g_TEL) {
		G_TEL = g_TEL;
	}

	public String getG_EDU_YN() {
		return G_EDU_YN;
	}

	public void setG_EDU_YN(String g_EDU_YN) {
		G_EDU_YN = g_EDU_YN;
	}

	public String getG_IN_OUT() {
		return G_IN_OUT;
	}

	public void setG_IN_OUT(String g_IN_OUT) {
		G_IN_OUT = g_IN_OUT;
	}

	public Gym() {

	}

	public Gym(int g_NO, String g_TYPE_NM, String g_GU_NM, String g_NAME, String g_ADDRESS, double g_YCODE,
			double g_XCODE, String g_TEL, String g_EDU_YN, String g_IN_OUT) {
		super();
		G_NO = g_NO;
		G_TYPE_NM = g_TYPE_NM;
		G_GU_NM = g_GU_NM;
		G_NAME = g_NAME;
		G_ADDRESS = g_ADDRESS;
		G_YCODE = g_YCODE;
		G_XCODE = g_XCODE;
		G_TEL = g_TEL;
		G_EDU_YN = g_EDU_YN;
		G_IN_OUT = g_IN_OUT;
	}

	public Gym(int g_NO, String g_TYPE_NM, String g_GU_NM, String g_NAME, String g_ADDRESS, double g_YCODE,
			double g_XCODE) {
		super();
		G_NO = g_NO;
		G_TYPE_NM = g_TYPE_NM;
		G_GU_NM = g_GU_NM;
		G_NAME = g_NAME;
		G_ADDRESS = g_ADDRESS;
		G_YCODE = g_YCODE;
		G_XCODE = g_XCODE;
	}


	public Gym(int g_NO, String g_TYPE_NM, String g_GU_NM, String g_NAME, String g_ADDRESS, double g_YCODE,
			double g_XCODE, String g_TEL, String g_EDU_YN, String g_IN_OUT, char g_STATUS, int g_COUNT, int g_COVID) {
		super();
		G_NO = g_NO;
		G_TYPE_NM = g_TYPE_NM;
		G_GU_NM = g_GU_NM;
		G_NAME = g_NAME;
		G_ADDRESS = g_ADDRESS;
		G_YCODE = g_YCODE;
		G_XCODE = g_XCODE;
		G_TEL = g_TEL;
		G_EDU_YN = g_EDU_YN;
		G_IN_OUT = g_IN_OUT;
		G_STATUS = g_STATUS;
		G_COUNT = g_COUNT;
		G_COVID = g_COVID;
	}

	@Override
	public String toString() {
		return "Gym [G_NO=" + G_NO + ", G_TYPE_NM=" + G_TYPE_NM + ", G_GU_NM=" + G_GU_NM + ", G_NAME=" + G_NAME
				+ ", G_ADDRESS=" + G_ADDRESS + ", G_YCODE=" + G_YCODE + ", G_XCODE=" + G_XCODE + ", G_TEL=" + G_TEL
				+ ", G_EDU_YN=" + G_EDU_YN + ", G_IN_OUT=" + G_IN_OUT + ", G_STATUS=" + G_STATUS + ", G_COUNT="
				+ G_COUNT + ", G_COVID=" + G_COVID + ", G_FILE=" + G_FILE + "]";
	}
	
}
