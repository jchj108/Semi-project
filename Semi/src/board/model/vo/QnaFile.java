package board.model.vo;

public class QnaFile {
	private int q_file_no;
	private String q_file;
	private String q_file_status;
	private int boardNo; // q_no
	private String originName;
	private String changeName;
	
	public QnaFile() {
		
	}

	
	
	
	public QnaFile(int q_file_no, String q_file, String q_file_status, int boardNo, String originName,
			String changeName) {
		super();
		this.q_file_no = q_file_no;
		this.q_file = q_file;
		this.q_file_status = q_file_status;
		this.boardNo = boardNo;
		this.originName = originName;
		this.changeName = changeName;
	}




	public QnaFile(int q_file_no, String q_file, String q_file_status, int boardNo) {
		super();
		this.q_file_no = q_file_no;
		this.q_file = q_file;
		this.q_file_status = q_file_status;
		this.boardNo = boardNo;
	}




	public int getQ_file_no() {
		return q_file_no;
	}




	public void setQ_file_no(int q_file_no) {
		this.q_file_no = q_file_no;
	}




	public String getQ_file() {
		return q_file;
	}




	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}




	public String getQ_file_status() {
		return q_file_status;
	}




	public void setQ_file_status(String q_file_status) {
		this.q_file_status = q_file_status;
	}




	public int getBoardNo() {
		return boardNo;
	}




	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}




	public String getOriginName() {
		return originName;
	}




	public void setOriginName(String originName) {
		this.originName = originName;
	}




	public String getChangeName() {
		return changeName;
	}




	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}




	@Override
	public String toString() {
		return "QnaFile [q_file_no=" + q_file_no + ", q_file=" + q_file + ", q_file_status=" + q_file_status
				+ ", boardNo=" + boardNo + ", originName=" + originName + ", changeName=" + changeName + "]";
	}

	
	
	

	
	
	
}
