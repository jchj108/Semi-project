package board.model.vo;

import java.sql.Date;

public class Board {
	private int q_no;
	private String q_title;
	private String q_body;
	private Date q_date;
	private int q_count;
	private String q_secret;
	private String q_status;
	private String q_board_div;
	private int wirterNo;	// 작성자 m_no
	private String writerName;	// 작성자에 m_no 통해 이름 받아오기
	
	public Board() {
		
	}

	public Board(int q_no, String q_title, String q_body, Date q_date, int q_count, String q_secret, String q_status,
			String q_board_div, int wirterNo, String writerName) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_body = q_body;
		this.q_date = q_date;
		this.q_count = q_count;
		this.q_secret = q_secret;
		this.q_status = q_status;
		this.q_board_div = q_board_div;
		this.wirterNo = wirterNo;
		this.writerName = writerName;
	}

	public Board(int q_no, String q_title, String q_body, Date q_date, int q_count, String q_secret, String q_board_div,
			int wirterNo, String writerName) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_body = q_body;
		this.q_date = q_date;
		this.q_count = q_count;
		this.q_secret = q_secret;
		this.q_board_div = q_board_div;
		this.wirterNo = wirterNo;
		this.writerName = writerName;
	}	

	public Board(String q_title, String q_body, Date q_date, int q_count, int wirterNo) {
		super();
		this.q_title = q_title;
		this.q_body = q_body;
		this.q_date = q_date;
		this.q_count = q_count;
		this.wirterNo = wirterNo;
	}

	public Board(int q_no, String q_title, Date q_date, int wirterNo) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_date = q_date;
		this.wirterNo = wirterNo;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_body() {
		return q_body;
	}

	public void setQ_body(String q_body) {
		this.q_body = q_body;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public int getQ_count() {
		return q_count;
	}

	public void setQ_count(int q_count) {
		this.q_count = q_count;
	}

	public String getQ_secret() {
		return q_secret;
	}

	public void setQ_secret(String q_secret) {
		this.q_secret = q_secret;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public String getQ_board_div() {
		return q_board_div;
	}

	public void setQ_board_div(String q_board_div) {
		this.q_board_div = q_board_div;
	}

	public int getWirterNo() {
		return wirterNo;
	}

	public void setWirterNo(int wirterNo) {
		this.wirterNo = wirterNo;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	@Override
	public String toString() {
		return "Board [q_no=" + q_no + ", q_title=" + q_title + ", q_body=" + q_body + ", q_date=" + q_date
				+ ", q_count=" + q_count + ", q_secret=" + q_secret + ", q_status=" + q_status + ", q_board_div="
				+ q_board_div + ", wirterNo=" + wirterNo + ", m_name=" + writerName + "]";
	}	
	
}
