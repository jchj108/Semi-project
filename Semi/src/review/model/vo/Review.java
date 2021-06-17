package review.model.vo;

import java.sql.Date;

public class Review {
	private int r_no;
	private String r_body;
	private Date r_date;
	private int r_total; // 전체 점수
	private int r_teacher; // 강사 점수
	private int r_service; // 서비스 점수
	private int r_gym; // 시설 점수
	private String r_keyword;
	private String r_status;
	private int reviewerNo; // 작성자 m_no
	private String reviewerName; // 작성자 이름
	private int gymNo; // 시설 g_no
	
	public Review() {
		
	}

	public Review(int r_no, String r_body, Date r_date, int r_total, int r_teacher, int r_service, int r_gym,
			String r_keyword, String r_status, int reviewerNo, String reviewerName, int gymNo) {
		super();
		this.r_no = r_no;
		this.r_body = r_body;
		this.r_date = r_date;
		this.r_total = r_total;
		this.r_teacher = r_teacher;
		this.r_service = r_service;
		this.r_gym = r_gym;
		this.r_keyword = r_keyword;
		this.r_status = r_status;
		this.reviewerNo = reviewerNo;
		this.reviewerName = reviewerName;
		this.gymNo = gymNo;
	}
	
	
		
	public Review(int r_no, String r_body, Date r_date, int r_total) {
		super();
		this.r_no = r_no;
		this.r_body = r_body;
		this.r_date = r_date;
		this.r_total = r_total;
	}

	public Review(int r_no, String r_body, Date r_date) {
		super();
		this.r_no = r_no;
		this.r_body = r_body;
		this.r_date = r_date;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_body() {
		return r_body;
	}

	public void setR_body(String r_body) {
		this.r_body = r_body;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_total() {
		return r_total;
	}

	public void setR_total(int r_total) {
		this.r_total = r_total;
	}

	public int getR_teacher() {
		return r_teacher;
	}

	public void setR_teacher(int r_teacher) {
		this.r_teacher = r_teacher;
	}

	public int getR_service() {
		return r_service;
	}

	public void setR_service(int r_service) {
		this.r_service = r_service;
	}

	public int getR_gym() {
		return r_gym;
	}

	public void setR_gym(int r_gym) {
		this.r_gym = r_gym;
	}

	public String getR_keyword() {
		return r_keyword;
	}

	public void setR_keyword(String r_keyword) {
		this.r_keyword = r_keyword;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public int getReviewerNo() {
		return reviewerNo;
	}

	public void setReviewerNo(int reviewerNo) {
		this.reviewerNo = reviewerNo;
	}

	public String getReviewerName() {
		return reviewerName;
	}

	public void setReviewerName(String reviewerName) {
		this.reviewerName = reviewerName;
	}

	public int getGymNo() {
		return gymNo;
	}

	public void setGymNo(int gymNo) {
		this.gymNo = gymNo;
	}

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", r_body=" + r_body + ", r_date=" + r_date + ", r_total=" + r_total
				+ ", r_teacher=" + r_teacher + ", r_service=" + r_service + ", r_gym=" + r_gym + ", r_keyword="
				+ r_keyword + ", r_status=" + r_status + ", reviewerNo=" + reviewerNo + ", reviewerName=" + reviewerName
				+ ", gymNo=" + gymNo + "]";
	}
	
	
}
