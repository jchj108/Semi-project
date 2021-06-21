package comments.model.vo;

import java.sql.Date;

public class Comments {
	private int c_no;
	private String c_body;
	private	Date c_date;
	private String c_status;
	private int bNo;	// 댓글 달린 글 q_no, q_no이랑 헷갈릴까봐 bNo으로 함
	private int cWriterNo; // 댓글 작성자 m_no
	private String cWriterName; // 댓글 작성자 번호 통해 이름 가져오기
	
	public Comments() {
		
	}

	public Comments(int c_no, String c_body, Date c_date, String c_status, int bNo, int cWriterNo, String cWriterName) {
		super();
		this.c_no = c_no;
		this.c_body = c_body;
		this.c_date = c_date;
		this.c_status = c_status;
		this.bNo = bNo;
		this.cWriterNo = cWriterNo;
		this.cWriterName = cWriterName;
	}

	public Comments(int c_no, String c_body, Date c_date, int bNo, int cWriterNo, String cWriterName) {
		super();
		this.c_no = c_no;
		this.c_body = c_body;
		this.c_date = c_date;
		this.bNo = bNo;
		this.cWriterNo = cWriterNo;
		this.cWriterName = cWriterName;
	}

	public Comments(int c_no, String c_body, Date c_date, int bNo, int cWriterNo) {
		super();
		this.c_no = c_no;
		this.c_body = c_body;
		this.c_date = c_date;
		this.bNo = bNo;
		this.cWriterNo = cWriterNo;
	}	

	public Comments(int c_no, String c_body, Date c_date, int bNo) {
		super();
		this.c_no = c_no;
		this.c_body = c_body;
		this.c_date = c_date;
		this.bNo = bNo;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_body() {
		return c_body;
	}

	public void setC_body(String c_body) {
		this.c_body = c_body;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public String getC_status() {
		return c_status;
	}

	public void setC_status(String c_status) {
		this.c_status = c_status;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getcWriterNo() {
		return cWriterNo;
	}

	public void setcWriterNo(int cWriterNo) {
		this.cWriterNo = cWriterNo;
	}

	public String getcWriterName() {
		return cWriterName;
	}

	public void setcWriterName(String cWriterName) {
		this.cWriterName = cWriterName;
	}

	@Override
	public String toString() {
		return "Comments [c_no=" + c_no + ", c_body=" + c_body + ", c_date=" + c_date + ", c_status=" + c_status
				+ ", bNo=" + bNo + ", cWriterNo=" + cWriterNo + ", cWriterName=" + cWriterName + "]";
	}
	
	
	

}
